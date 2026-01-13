# Dify 项目 - AI 上下文文档

> 版本：1.11.2
> 最后更新：2025-01-02

---

## 项目概述

Dify 是一个开源的 LLM 应用开发平台，提供直观的界面，结合了 AI 智能体工作流、RAG 管道、Agent 能力和模型管理。

### 核心特性

- **AI 工作流编排**：可视化构建复杂的 AI 应用流程
- **RAG 管道**：检索增强生成，支持多种向量数据库
- **Agent 能力**：智能代理协作与工具调用
- **模型管理**：统一管理多种 LLM 提供商

---

## 技术栈概览

### 后端技术栈

| 类别 | 技术 | 版本 | 说明 |
|------|------|------|------|
| **语言** | Python | 3.11-3.12 | 使用 uv 包管理器 |
| **Web 框架** | Flask | 3.1.2 | 核心 API 框架 |
| **异步任务** | Celery | 5.5.2 | Redis 作为 broker |
| **数据库** | PostgreSQL | - | SQLAlchemy 2.0 ORM |
| **向量数据库** | 多种支持 | - | Weaviate/Qdrant/PgVector 等 |
| **API 文档** | Flask-RESTX | 1.3.0 | RESTful API 规范 |
| **类型检查** | basedpyright | 1.31.0 | 静态类型检查 |
| **代码格式化** | Ruff | 0.14.0 | 统一代码风格 |

### 前端技术栈

| 类别 | 技术 | 版本 | 说明 |
|------|------|------|------|
| **语言** | TypeScript | 5.9.3 | 严格模式 |
| **框架** | Next.js | 15.5.9 | App Router 架构 |
| **UI 库** | React | 19.2.3 | 最新版本 |
| **状态管理** | Jotai / Zustand | - | 原子化状态管理 |
| **数据获取** | TanStack Query | 5.90.5 | 服务端状态管理 |
| **样式** | Tailwind CSS | 3.4.18 | 实用优先 CSS |
| **编辑器** | Monaco Editor | - | 代码编辑组件 |
| **图形** | ReactFlow | 11.11.4 | 工作流可视化 |
| **测试** | Vitest | 4.0.16 | 单元测试框架 |
| **包管理器** | pnpm | 10.26.2 | 快速、节省磁盘空间 |

---

## 项目目录结构

```
dify/
├── api/                        # 后端 API（Python Flask）
│   ├── core/                   # 核心业务逻辑
│   │   ├── agent/             # Agent 相关逻辑
│   │   ├── app/               # 应用核心逻辑
│   │   ├── datasource/        # 数据源管理
│   │   ├── entities/          # 领域实体
│   │   ├── model_runtime/     # 模型运行时
│   │   ├── rag/               # RAG 检索增强
│   │   ├── tools/             # 工具集成
│   │   ├── workflow/          # 工作流引擎
│   │   └── ...
│   ├── services/              # 业务服务层（DDD）
│   ├── controllers/           # API 控制器
│   ├── models/                # 数据模型（ORM）
│   ├── repositories/          # 数据访问层
│   ├── extensions/            # 扩展模块
│   ├── tasks/                 # Celery 异步任务
│   ├── migrations/            # 数据库迁移
│   └── tests/                 # 后端测试
│
├── web/                        # 前端 Web（Next.js）
│   ├── app/                   # Next.js App Router
│   │   ├── (commonLayout)/    # 通用布局
│   │   ├── (shareLayout)/     # 共享布局
│   │   ├── account/           # 账户相关页面
│   │   ├── components/        # 共享组件
│   │   ├── signin/            # 登录页面
│   │   └── ...
│   ├── context/               # React Context（状态管理）
│   ├── hooks/                 # 自定义 Hooks
│   ├── service/               # API 服务层
│   ├── utils/                 # 工具函数
│   ├── types/                 # TypeScript 类型定义
│   ├── i18n/                  # 国际化翻译文件
│   ├── test/                  # 前端测试
│   └── ...
│
├── docker/                     # Docker 配置
│   ├── middleware/            # 中间件服务（DB、Redis）
│   └── ...
│
├── docs/                       # 项目文档
├── sdks/                       # 客户端 SDK
└── .github/                    # GitHub Actions CI/CD
```

---

## 后端架构详解

### 领域驱动设计（DDD）

后端采用严格的 DDD 分层架构：

```
┌─────────────────────────────────────────────────────┐
│                   Controllers Layer                  │
│              (API 路由与请求处理)                      │
└────────────────────┬────────────────────────────────┘
                     │
┌────────────────────┴────────────────────────────────┐
│                  Services Layer                      │
│              (业务逻辑与领域服务)                       │
└────────────────────┬────────────────────────────────┘
                     │
┌────────────────────┴────────────────────────────────┐
│               Repositories Layer                     │
│              (数据访问与持久化)                        │
└────────────────────┬────────────────────────────────┘
                     │
┌────────────────────┴────────────────────────────────┐
│                   Database                           │
└─────────────────────────────────────────────────────┘
```

### 核心 Core 模块

`api/core/` 包含平台的核心业务逻辑：

| 模块 | 功能描述 |
|------|----------|
| **agent/** | Agent 执行、策略、工具管理 |
| **app/** | 应用配置、执行、DSL 解析 |
| **datasource/** | 外部数据源集成（Notion、GitHub 等） |
| **model_runtime/** | LLM 模型运行时，支持多家提供商 |
| **rag/** | 检索增强生成，文档索引与检索 |
| **workflow/** | 工作流引擎，节点执行与流控制 |
| **tools/** | 内置工具与第三方工具集成 |
| **mcp/** | Model Context Protocol 集成 |

### 异步任务处理

使用 **Celery + Redis** 处理后台任务：

- 文档索引与解析
- 工作流异步执行
- 数据集批量导入
- 邮件发送与通知

---

## 前端架构详解

### Next.js App Router

采用 Next.js 15 的 App Router 架构：

- **文件系统路由**：基于 `app/` 目录结构自动生成路由
- **服务端组件**：默认使用 Server Components 提升性能
- **流式渲染**：支持 React 19 的流式 SSR

### 状态管理策略

```
┌─────────────────────────────────────────────────────┐
│                   Jotai Atoms                        │
│           (客户端原子化状态管理)                       │
│  - UI 状态（模态框、侧边栏等）                          │
│  - 临时表单数据                                        │
└─────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────┐
│                 TanStack Query                       │
│           (服务端状态管理)                             │
│  - API 请求缓存                                        │
│  - 自动重新获取                                        │
│  - 乐观更新                                            │
└─────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────┐
│                 React Context                        │
│          (全局共享状态)                                │
│  - 用户认证信息                                        │
│  - 应用配置                                            │
│  - 主题设置                                            │
└─────────────────────────────────────────────────────┘
```

### Context 结构

| Context | 用途 |
|---------|------|
| `app-context.tsx` | 应用全局状态 |
| `provider-context.tsx` | LLM 提供商配置 |
| `modal-context.tsx` | 全局模态框管理 |
| `workspace-context.tsx` | 工作空间状态 |
| `datasets-context.tsx` | 数据集管理 |

### 自定义 Hooks

`web/hooks/` 包含可复用的逻辑封装：

- `use-query-params.ts`：URL 查询参数管理
- `use-metadata.ts`：页面元数据处理
- `use-format-time-from-now.ts`：时间格式化
- `use-async-window-open.ts`：安全窗口打开
- `use-theme.ts`：主题切换

---

## 开发工作流

### 环境准备

```bash
# 克隆仓库
git clone https://github.com/langgenius/dify.git
cd dify

# 一键设置开发环境
make dev-setup
```

`dev-setup` 会自动完成：
1. 启动 Docker 中间件（PostgreSQL、Redis）
2. 安装前端依赖（pnpm）
3. 安装后端依赖（uv sync）
4. 运行数据库迁移

### 后端开发

**命令执行：**
```bash
# 通过 uv 运行后端命令
uv run --project api <command>

# 例如：运行 Flask 开发服务器
uv run --project api flask run
```

**代码质量检查（提交前必须通过）：**
```bash
# 格式化代码
make format

# 运行 linter（格式化 + 检查 + 导入排序）
make lint

# 类型检查
make type-check

# 运行单元测试
make test
```

**或者分别执行：**
```bash
cd api

# Ruff 格式化
uv run --dev ruff format ./api

# Ruff 检查并修复
uv run --dev ruff check --fix ./api

# 导入排序检查
uv run --dev lint-imports

# basedpyright 类型检查
uv run --dev basedpyright

# 运行测试
uv run --project api --dev dev/pytest/pytest_unit_tests.sh
```

### 前端开发

```bash
cd web

# 安装依赖
pnpm install

# 启动开发服务器（支持 Turbopack）
pnpm dev

# 构建生产版本
pnpm build

# 代码质量检查
pnpm lint:fix          # ESLint 修复
pnpm type-check:tsgo   # TypeScript 类型检查（tsgo）

# 运行测试
pnpm test              # 单次运行
pnpm test:coverage     # 生成覆盖率报告
pnpm test:watch        # 监视模式

# 分析组件复杂度
pnpm analyze-component <ComponentPath>

# 重构组件
pnpm refactor-component <ComponentPath>
```

---

## 代码质量标准

### 后端代码规范

**Python 类型提示：**
```python
from typing import List, Optional
from pydantic import BaseModel

class UserService:
    def get_user(self, user_id: str) -> Optional[UserDTO]:
        """获取用户信息

        Args:
            user_id: 用户 ID

        Returns:
            用户对象，不存在时返回 None
        """
        ...
```

**关键要求：**
- 所有函数必须有类型提示
- 使用 Pydantic 模型进行数据验证
- 实现 `__repr__` 和 `__str__` 特殊方法
- 遵循 PEP 8 命名规范

**Ruff 配置：**
- 行长度：120 字符
- 引号：双引号
- 启用 preview 模式

### 前端代码规范

**TypeScript 严格模式：**
```typescript
interface UserProfile {
  id: string
  name: string
  email?: string  // 可选属性
}

const useUserProfile = (userId: string): UserProfile | null => {
  // 不要使用 any
  const profile = useMemo(() => {
    return fetchProfile(userId)
  }, [userId])

  return profile
}
```

**关键要求：**
- 使用 `type` 关键字定义类型（而非 interface）
- 避免 `any` 类型
- 组件使用函数式声明
- 使用 `const` 断言而非 `as`

**ESLint 配置：**
- 基于 `@antfu/eslint-config`
- React Compiler 规则（warn 级别）
- SonarJS 代码质量检查
- Storybook 规则

---

## 测试策略

### 后端测试

**框架：** `pytest`

**结构：** Arrange-Act-Assert（AAA 模式）
```python
def test_user_service_get_user_should_return_user_when_exists(user_service):
    # Arrange
    user_id = "test-user-id"
    expected_user = User(id=user_id, name="Test User")
    repositoryMock.return_value = expected_user

    # Act
    result = user_service.get_user(user_id)

    # Assert
    assert result.id == user_id
    assert result.name == "Test User"
```

**运行测试：**
```bash
# 单元测试（本地运行）
uv run --project api --dev dev/pytest/pytest_unit_tests.sh

# 集成测试（仅 CI）
# 本地环境不运行集成测试
```

### 前端测试

**框架：** Vitest + React Testing Library

**关键原则：**
- 遵循 `web/testing/testing.md` 规范
- 符合 `frontend-testing` skill 要求
- 测试文件与源文件同目录，命名为 `.spec.ts`

**示例：**
```typescript
import { describe, it, expect } from 'vitest'
import { render } from '@testing-library/react'
import { UserProfile } from './user-profile'

describe('UserProfile', () => {
  it('should render user name', () => {
    const user = { id: '1', name: 'Alice' }
    const { getByText } = render(<UserProfile user={user} />)

    expect(getByText('Alice')).toBeInTheDocument()
  })
})
```

---

## 国际化（i18n）

### 翻译文件位置

所有用户可见的字符串必须在 `web/i18n/` 中定义：

```
web/i18n/
├── en-US/           # 英语（基础语言）
├── zh-Hans/         # 简体中文
├── zh-Hant/         # 繁体中文
├── ja-JP/           # 日语
├── ko-KR/           # 韩语
├── es-ES/           # 西班牙语
├── fr-FR/           # 法语
├── de-DE/           # 德语
└── ...
```

### 使用方式

**在组件中：**
```typescript
import { useTranslation } from 'react-i18next'

function MyComponent() {
  const { t } = useTranslation()

  return <div>{t('common.save')}</div>
}
```

**检查翻译完整性：**
```bash
pnpm i18n:check
```

**自动生成翻译键：**
```bash
pnpm i18n:gen
```

---

## 项目约定

### 后端约定

1. **架构分层**
   - Controllers → Services → Repositories
   - 跨层调用必须遵循依赖方向
   - 使用依赖注入（通过构造函数）

2. **错误处理**
   - 在正确层级抛出领域特定异常
   - 避免在业务逻辑中捕获通用异常

3. **异步任务**
   - 长时间运行的任务通过 Celery 异步执行
   - Redis 作为消息 broker

### 前端约定

1. **组件设计**
   - 优先编辑现有文件
   - 仅在明确需要时添加新文件
   - 遵循单一职责原则

2. **字符串处理**
   - 用户可见字符串必须使用 i18n
   - 避免硬编码文本

3. **状态管理**
   - 客户端临时状态：Jotai atoms
   - 服务端状态：TanStack Query
   - 全局共享状态：React Context

---

## 提交前检查清单

### 后端修改

- [ ] `make lint` 通过
- [ ] `make type-check` 通过
- [ ] `make test` 通过（单元测试）
- [ ] 代码符合 DDD 分层原则
- [ ] 所有函数有类型提示

### 前端修改

- [ ] `pnpm lint:fix` 无错误
- [ ] `pnpm type-check:tsgo` 无错误
- [ ] `pnpm test` 通过
- [ ] 用户字符串使用 i18n
- [ ] 避免使用 `any` 类型

---

## 常见问题

### 后端

**Q: 如何添加新的 API 端点？**
A: 在 `api/controllers/` 中创建控制器，遵循 RESTful 规范。

**Q: 如何处理文件上传？**
A: 使用 Flask 的文件上传处理，在 `core/file/` 中有现成实现。

**Q: 如何添加新的 Celery 任务？**
A: 在 `api/tasks/` 中创建任务文件，使用 `@celery.task` 装饰器。

### 前端

**Q: 如何添加新页面？**
A: 在 `web/app/` 中创建新目录，添加 `page.tsx`。

**Q: 如何共享组件逻辑？**
A: 创建自定义 Hook 在 `web/hooks/` 中。

**Q: 如何处理 API 请求？**
A: 使用 `web/service/` 中的服务函数，结合 TanStack Query。

---

## 版本信息

- **当前版本**：1.11.2
- **Python 要求**：>= 3.11, < 3.13
- **Node 要求**：>= v22.11.0
- **包管理器**：后端 uv，前端 pnpm

---

## 参考资源

- [Dify 官方文档](https://docs.dify.ai)
- [Flask 文档](https://flask.palletsprojects.com)
- [Next.js 文档](https://nextjs.org/docs)
- [DDD 领域驱动设计](https://martinfowler.com/tags/domain%20driven%20design.html)

---

*本文档由 AI 自动生成，如有疑问请参考项目英文版 AGENTS.md*
