# BlueArchiveMiniGame

基于 Unity 的 BA 小队搜打撤原型。小队采用 **4 名前排 + 2 名支援**，能够自动行动，也允许玩家选择学生并下达移动、集火和 EX 指令。

当前 Demo 主要验证「编队 → 出场演出 → 小队战斗 → 撤离 → 结算」流程。搜刮、背包、经济和永久存档仍在后续计划中。

## 开发环境

- Unity **2022.3.62f2**，URP **14.0.12**。
- Input System **1.14.2**、Cinemachine **2.10.3**、Timeline **1.7.7**。
- YooAsset **3.0.6**、HybridCLR **v9.0.3**。

以 [ProjectVersion.txt](ProjectSettings/ProjectVersion.txt) 和 [manifest.json](Packages/manifest.json) 为准。

## 快速运行

1. 克隆仓库，在 Unity Hub 中添加仓库根目录，使用上述 Unity 版本打开。
2. 换电脑时，先处理 `Packages/manifest.json` 中 Unity MCP 的本地包引用：当前路径为 `C:/UnityProject/unity-mcp-beta/MCPForUnity`，需要安装对应工具并调整为实际路径。这是编辑器工具依赖。
3. 打开 [Player_GameDev.unity](Assets/GameRes/Scenes/Player_GameDev.unity)，点击 Play。
4. 在三维编队页调整阵容，点击出击；战斗中将全部存活前排带到绿色撤离圈，停稳并连续保持 **3 秒**，才会触发胜利。清空敌人不会直接胜利。

需要检查资源更新和完整启动流程时，使用 [Boot.unity](Assets/Boot.unity)。角色试玩优先使用上面的 Demo 场景。

当前 Demo 前排为天童爱丽丝、才羽绿、才羽桃井和花冈柚子；支援为花冈柚子（女仆）与花冈柚子（临战）。第一名前排是队长，入场使用队长的出场语音。支援不常驻地面，也不计入撤离人数。

## 基本操作

| 操作 | 功能 |
| --- | --- |
| 左键点选或框选；Shift 追加 | 选择前排学生 |
| 数字 1–4；数字 5 | 单选对应前排；全选 |
| 右键地面；右键敌人 | 移动；指定集火 |
| Alt + 右键 | 攻击移动 |
| H；X | 停驻；恢复自动行为 |
| F1–F4 | 四名前排 EX |
| F5 | 女仆柚子支援炮击 |
| 先选前排，再按 F6 | 对所选前排施加临战柚子支援 |
| Space | 战术暂停 |
| WASD／鼠标中键拖动；滚轮 | 平移镜头；缩放 |

也可以点击战斗界面的技能卡。暂停时可以选择学生、下达移动命令，但不能施放 EX。当前技能界面尚未实现原版 COST 抽牌系统。

## 工程目录

| 目录 | 用途 |
| --- | --- |
| `Assets/GameFramework` | 不依赖具体玩法的可复用框架 |
| `Assets/GameScript/Runtime` | 启动与不可热更的游戏代码 |
| `Assets/GameScript/HotUpdate/Preload`、`Main` | 预加载及主要游戏热更逻辑 |
| `Assets/GameScript/Editor` | 编辑器工具 |
| `Assets/GameScript/Test`、`Tests` | 现有试验与测试内容 |
| `Assets/GameRes/Characters` | 按人物、形态分类的角色资源 |
| `Assets/GameRes/Battle` | 小队配置、单位预制体、界面与演出 |
| `Assets/GameRes/Scenes` | 游戏场景 |
| `Assets/GameSetting` | 渲染、音频与资源管理配置 |
| `Assets/ThirdParty`、`Plugins` | 第三方依赖与原生插件 |
| `Assets/HybridCLRGenerate` | HybridCLR 生成内容 |

当前战斗单位入口位于 `Assets/GameRes/Battle/Characters`。人物目录中的模型 Prefab、Avatar 和演出预制体各有用途，接入说明见 [开发与资源使用指南](Documentation/框架与资源使用指南.md)。

## 当前范围

- 游戏开发部资源包含普通、女仆及临战在内的 10 个形态，当前 Demo 接入的是上述 4＋2 阵容。
- 敌人目前只有生命和碰撞，尚未实现敌方 AI。
- 编队、演出和技能表现仍在迭代，不代表全部原版功能已复原或所有形态已验收。
- 修改 AOT 代码后需要重新构建播放器；修改热更代码后，需要重新生成对应 DLL 和资源包。编辑器 Play 通过不等同于 IL2CPP 发布验证。

后续设计见 [系统需求文档 v0.3](Documentation/BlueArchive_小队搜打撤_系统需求文档_v0.3.docx) 和 [游戏策划案 v0.3](Documentation/BlueArchive_小队搜打撤_游戏策划案_v0.3.docx)。

## 版本控制与同步

- 当前版本没有使用 Git LFS 的文件，普通克隆即可获得完整资源。
- **只有单个文件超过 100 MiB 才使用 LFS**，按具体文件路径添加规则；不再对所有 `.anim` 文件统一启用 LFS。Git 不会自动按大小切换，需要在提交新增大文件前设置。
- 资源文件与对应 `.meta` 一起提交。`Library`、`Temp`、构建缓存、截图和捕获视频按 [.gitignore](.gitignore) 排除。
- 日常推送到 Gitea 的 `origin/main`，再由 Gitea 推送镜像同步到 [GitHub](https://github.com/GTuanTuan/BlueArchiveMiniGame)。两端 `main` 的提交 SHA 一致，即可确认该次提交已同步。
- GitHub 镜像会被 Gitea 强制同步，独立修改应先回到 Gitea 主线，避免被后续同步覆盖。
