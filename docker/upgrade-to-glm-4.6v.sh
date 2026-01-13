#!/bin/bash
# GLM-4.6V 快速升级脚本
# 使用方法: bash upgrade-to-glm-4.6v.sh

set -e

echo "=========================================="
echo "   GLM-4.6V 升级配置脚本"
echo "=========================================="
echo ""

# 颜色定义
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# 检查 Dify 是否运行
echo -e "${YELLOW}[1/5] 检查 Dify 服务状态...${NC}"
if docker ps | grep -q "dify"; then
    echo -e "${GREEN}✓ Dify 服务正在运行${NC}"
else
    echo -e "${RED}✗ Dify 服务未运行${NC}"
    echo "请先启动 Dify: cd /Users/berton/Github/dify/docker && docker compose up -d"
    exit 1
fi

echo ""

# 显示配置步骤
echo -e "${YELLOW}[2/5] 配置步骤说明${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "1. 获取智谱AI API Key:"
echo "   访问: https://open.bigmodel.cn/"
echo "   登录后进入「API Keys」页面"
echo "   点击「创建新的 API Key」"
echo "   复制生成的 Key"
echo ""
echo "2. 在 Dify 中添加 GLM-4.6V:"
echo "   访问: http://localhost/settings"
echo "   点击「模型提供商」"
echo "   找到「Zhipu AI」"
echo "   点击「添加凭证」"
echo "   输入 API Key"
echo ""
echo "3. 更新工作流模型:"
echo "   在工作流编辑器中"
echo "   将 'glm-4v' 替换为 'glm-4.6v'"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# 询问是否打开浏览器
echo -e "${YELLOW}[3/5] 是否打开 Dify 配置页面？${NC}"
read -p "输入 y 打开浏览器，按回车跳过: " open_browser

if [ "$open_browser" = "y" ] || [ "$open_browser" = "Y" ]; then
    echo "正在打开浏览器..."
    open http://localhost/settings
fi

echo ""

# 显示模型对比
echo -e "${YELLOW}[4/5] GLM-4.6V vs GLM-4.5V 对比${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
printf "%-20s %-15s %-15s %-15s\n" "特性" "GLM-4.5V" "GLM-4.6V" "提升"
echo "────────────────────────────────────────────────"
printf "%-20s %-15s %-15s %-15s\n" "上下文窗口" "32K" "128K" "4倍 ⭐"
printf "%-20s %-15s %-15s %-15s\n" "API价格(¥/M)" "20" "1" "降价95% 🎉"
printf "%-20s %-15s %-15s %-15s\n" "图表识别准确率" "92%" "97%" "+5% ⭐"
printf "%-20s %-15s %-15s %-15s\n" "编程能力" "⭐⭐⭐" "⭐⭐⭐⭐⭐" "接近Claude"
printf "%-20s %-15s %-15s %-15s\n" "Function Call" "支持" "原生支持" "质的飞跃"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# 成本估算
echo -e "${YELLOW}[5/5] 成本估算${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "假设月度使用：100次图表分析，每次2K tokens"
echo ""
echo "GLM-4.5V: 100次 × 2K × ¥20/M = ¥4/月"
echo "GLM-4.6V: 100次 × 2K × ¥1/M  = ¥0.2/月"
echo ""
echo -e "${GREEN}月节省: ¥3.8，年节省: ¥45.6${NC}"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# 询问是否需要测试
echo -e "${YELLOW}是否需要测试 GLM-4.6V 连接？${NC}"
read -p "输入 y 进行测试，按回车跳过: " test_connection

if [ "$test_connection" = "y" ] || [ "$test_connection" = "Y" ]; then
    echo ""
    echo "请按照以下步骤测试："
    echo "1. 打开 Dify 聊天界面: http://localhost"
    echo "2. 选择 GLM-4.6V 模型"
    echo "3. 发送消息：\"你好，请用一句话介绍你的能力。\""
    echo "4. 如果收到回复，说明配置成功！"
fi

echo ""
echo -e "${GREEN}=========================================="
echo "   升级脚本执行完成！"
echo "==========================================${NC}"
echo ""
echo "📚 完整升级指南: /Users/berton/Github/dify/docker/GLM-4.6V-Upgrade-Guide.md"
echo ""
echo "🎯 下一步："
echo "   1. 按照[2/5]步骤在 Dify 中配置 GLM-4.6V"
echo "   2. 更新你的工作流模型配置"
echo "   3. 运行测试验证功能"
echo ""
