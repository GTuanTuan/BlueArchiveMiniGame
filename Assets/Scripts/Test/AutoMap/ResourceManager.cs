// Assets/Scripts/Test/AutoMap/ResourceManager.cs
using UnityEngine;

public class ResourceManager
{
    private const string MATERIALS_PATH = "Assets/Scripts/Test/AutoMap/Materials/";

    public void InitializeResources(AutoMapGenerator generator)
    {
        // 检查并创建缺失的材质
        if (generator.buildingMaterial == null)
            generator.buildingMaterial = GetOrCreateMaterial("BuildingMat", new Color(0.8f, 0.8f, 0.8f));

        if (generator.roadMaterial == null)
            generator.roadMaterial = GetOrCreateMaterial("RoadMat", Color.gray);

        if (generator.parkMaterial == null)
            generator.parkMaterial = GetOrCreateMaterial("ParkMat", new Color(0.4f, 0.8f, 0.4f));

        if (generator.waterMaterial == null)
        {
            generator.waterMaterial = GetOrCreateMaterial("WaterMat", new Color(0.2f, 0.4f, 0.8f, 0.7f), true);
        }

        if (generator.groundMaterial == null)
            generator.groundMaterial = GetOrCreateMaterial("GroundMat", new Color(0.6f, 0.6f, 0.5f));
    }

    Material GetOrCreateMaterial(string name, Color color, bool isTransparent = false)
    {
#if UNITY_EDITOR
        // 首先尝试加载已存在的材质
        string assetPath = MATERIALS_PATH + name + ".mat";
        Material existingMat = UnityEditor.AssetDatabase.LoadAssetAtPath<Material>(assetPath);

        if (existingMat != null)
        {
            Debug.Log($"加载现有材质: {name}");
            return existingMat;
        }

        // 创建新材质
        Material mat;

        // 根据是否透明选择URP Shader
        if (isTransparent)
        {
            // URP 透明Shader
            Shader urpTransparentShader = Shader.Find("Universal Render Pipeline/Lit");
            if (urpTransparentShader != null)
            {
                mat = new Material(urpTransparentShader);
                mat.SetFloat("_Surface", 1); // 1 = Transparent
                mat.SetFloat("_Blend", 0);   // 0 = Alpha
                mat.SetFloat("_AlphaClip", 0); // 关闭Alpha裁剪
            }
            else
            {
                // 备用方案
                mat = new Material(Shader.Find("Standard"));
                mat.SetInt("_SrcBlend", (int)UnityEngine.Rendering.BlendMode.SrcAlpha);
                mat.SetInt("_DstBlend", (int)UnityEngine.Rendering.BlendMode.OneMinusSrcAlpha);
                mat.SetInt("_ZWrite", 0);
                mat.DisableKeyword("_ALPHATEST_ON");
                mat.EnableKeyword("_ALPHABLEND_ON");
                mat.DisableKeyword("_ALPHAPREMULTIPLY_ON");
                mat.renderQueue = 3000;
            }
        }
        else
        {
            // URP 不透明Shader
            Shader urpShader = Shader.Find("Universal Render Pipeline/Lit");
            if (urpShader != null)
            {
                mat = new Material(urpShader);
            }
            else
            {
                // 备用方案
                mat = new Material(Shader.Find("Standard"));
            }
        }

        mat.name = name;
        mat.color = color;

        // 确保目录存在
        string directory = System.IO.Path.GetDirectoryName(assetPath);
        if (!System.IO.Directory.Exists(directory))
        {
            System.IO.Directory.CreateDirectory(directory);
        }

        // 创建材质资产
        UnityEditor.AssetDatabase.CreateAsset(mat, assetPath);
        UnityEditor.AssetDatabase.SaveAssets();
        UnityEditor.AssetDatabase.Refresh();

        Debug.Log($"创建新材质: {name} 在路径: {assetPath}");
        return mat;
#else
        // 运行时创建简单材质
        Material runtimeMat = new Material(Shader.Find("Universal Render Pipeline/Lit"));
        runtimeMat.name = name;
        runtimeMat.color = color;
        
        if (isTransparent)
        {
            runtimeMat.SetFloat("_Surface", 1);
            runtimeMat.renderQueue = 3000;
        }
        
        Debug.Log($"创建运行时材质: {name}");
        return runtimeMat;
#endif
    }

    // 检查材质是否已存在的方法
    public bool CheckMaterialExists(string materialName)
    {
#if UNITY_EDITOR
        string assetPath = MATERIALS_PATH + materialName + ".mat";
        Material existingMat = UnityEditor.AssetDatabase.LoadAssetAtPath<Material>(assetPath);
        return existingMat != null;
#else
        return false;
#endif
    }

    // 获取所有已创建的材质（用于调试）
    public void LogExistingMaterials()
    {
#if UNITY_EDITOR
        Debug.Log("=== 现有材质列表 ===");
        string[] materialPaths = UnityEditor.AssetDatabase.FindAssets("t:Material", new[] { "Assets/Scripts/Test/AutoMap/Materials" });

        foreach (string guid in materialPaths)
        {
            string path = UnityEditor.AssetDatabase.GUIDToAssetPath(guid);
            Material mat = UnityEditor.AssetDatabase.LoadAssetAtPath<Material>(path);
            if (mat != null)
            {
                Debug.Log($"材质: {mat.name} - 路径: {path}");
            }
        }
#endif
    }
    public void CreateDefaultMaterialPresets()
    {
#if UNITY_EDITOR
        Debug.Log("创建默认材质预设...");

        // 建筑材质 - 灰色
        GetOrCreateMaterial("BuildingMat", new Color(0.8f, 0.8f, 0.8f));

        // 道路材质 - 深灰色
        GetOrCreateMaterial("RoadMat", new Color(0.3f, 0.3f, 0.3f));

        // 公园材质 - 绿色
        GetOrCreateMaterial("ParkMat", new Color(0.4f, 0.8f, 0.4f));

        // 水域材质 - 蓝色透明
        GetOrCreateMaterial("WaterMat", new Color(0.2f, 0.4f, 0.8f, 0.7f), true);

        // 地面材质 - 土黄色
        GetOrCreateMaterial("GroundMat", new Color(0.6f, 0.6f, 0.5f));

        Debug.Log("默认材质预设创建完成");
#endif
    }
}