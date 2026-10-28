using Cinemachine;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;

namespace Game.Battle
{
    public sealed class SquadCamera : MonoBehaviour
    {
        public BattleSession session;
        public SquadInput input;
        public Transform pivot;
        public CinemachineVirtualCamera virtualCamera;
        public Camera mainCamera;
        public bool useAuthoredRotation = true;
        public Vector3 viewEuler = new Vector3(55, 0, 0);
        public float moveSpeed = 12f;
        public float dragSpeed = 0.035f;
        public float explorationDistance = 22f;
        public float combatDistance = 17f;
        public float minDistance = 8f;
        public float maxDistance = 40f;
        public float zoomSpeed = 2f;
        public float zoomSmoothing = 7f;
        public float combatExitDelay = 3f;
        float zoomOffset;
        float distance;
        float combatHoldRemaining;

        void Start()
        {
            if (!mainCamera && session) mainCamera = session.mainCamera;
            var cameraTransform = virtualCamera ? virtualCamera.transform : mainCamera ? mainCamera.transform : null;
            if (useAuthoredRotation && cameraTransform) viewEuler = cameraTransform.eulerAngles;
            distance = Mathf.Clamp(explorationDistance, minDistance, maxDistance);
        }

        void LateUpdate()
        {
            if (!pivot || session && (session.Selecting || session.IsCutscene || session.ShowingIntro || session.Won || session.Lost)) return;
            float dt = Time.unscaledDeltaTime;
            Quaternion rotation = Quaternion.Euler(viewEuler);
            Vector3 right = rotation * Vector3.right;
            Vector3 forward = Vector3.Cross(right, Vector3.up).normalized;
            right.y = 0;
            right.Normalize();
            var keyboard = Keyboard.current;
            if (keyboard != null)
            {
                Vector2 direction = new Vector2((keyboard.dKey.isPressed ? 1 : 0) - (keyboard.aKey.isPressed ? 1 : 0),
                    (keyboard.wKey.isPressed ? 1 : 0) - (keyboard.sKey.isPressed ? 1 : 0));
                direction = Vector2.ClampMagnitude(direction, 1);
                pivot.position += (right * direction.x + forward * direction.y) * moveSpeed * dt;
            }
            var mouse = Mouse.current;
            bool overUI = input ? input.PointerOverUI :
                EventSystem.current && EventSystem.current.IsPointerOverGameObject();
            if (mouse != null && !overUI)
            {
                if (mouse.middleButton.isPressed)
                {
                    Vector2 delta = mouse.delta.ReadValue();
                    pivot.position -= (right * delta.x + forward * delta.y) * dragSpeed;
                }
                if (mouse.scroll.ReadValue().y != 0)
                    zoomOffset -= mouse.scroll.ReadValue().y / 120f * zoomSpeed;
            }
            bool engaged = false;
            Vector3 focus = Vector3.zero;
            int focused = 0;
            if (session && session.allies != null)
                foreach (var unit in session.allies)
                    if (unit && unit.health && unit.health.IsAlive && unit.Target && unit.Target.IsAlive)
                    {
                        engaged = true;
                        focus += (unit.transform.position + unit.Target.transform.position) * .5f;
                        focused++;
                    }
            if (focused > 0)
                pivot.position = Vector3.Lerp(pivot.position, focus / focused + Vector3.up * 1.30173f, 1f - Mathf.Exp(-3f * dt));
            if (engaged) combatHoldRemaining = combatExitDelay;
            else if (!session || !session.Paused) combatHoldRemaining = Mathf.Max(0, combatHoldRemaining - dt);
            float baseDistance = engaged || combatHoldRemaining > 0 ? combatDistance : explorationDistance;
            zoomOffset = Mathf.Clamp(zoomOffset, minDistance - baseDistance, maxDistance - baseDistance);
            float targetDistance = Mathf.Clamp(baseDistance + (engaged ? 0 : zoomOffset), minDistance, maxDistance);
            distance = Mathf.Lerp(distance, targetDistance, 1f - Mathf.Exp(-zoomSmoothing * dt));
            var target = virtualCamera ? virtualCamera.transform : mainCamera ? mainCamera.transform : null;
            if (target && target != pivot)
                target.SetPositionAndRotation(pivot.position - rotation * Vector3.forward * distance, rotation);
        }
    }
}
