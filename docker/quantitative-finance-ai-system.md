# 量化金融 AI 分析系统完整方案

> **版本**: v1.0
> **更新时间**: 2025-01-03
> **作者**: Claude Code + Happy
> **文档目的**: 基于 Dify + Anki 的智能量化金融分析系统架构与实现指南

---

## 📑 目录

- [系统概述](#系统概述)
- [技术架构](#技术架构)
- [核心功能模块](#核心功能模块)
- [工作流设计](#工作流设计)
- [模型配置](#模型配置)
- [数据集成](#数据集成)
- [部署指南](#部署指南)
- [使用场景](#使用场景)
- [成本分析](#成本分析)
- [最佳实践](#最佳实践)
- [进阶功能](#进阶功能)

---

## 系统概述

### 核心理念

```
多源数据输入 → AI 智能分析 → 策略生成与回测 → 风险评估 → 知识沉淀
```

### 系统特性

- ✅ **多模态市场分析**：K线图、财务报表、新闻图片的智能识别
- ✅ **数学建模专家**：期权定价、风险模型、统计检验的自动化推导
- ✅ **策略代码生成**：从概念到可执行代码的完整实现
- ✅ **回测与优化**：历史数据回测、参数优化、性能评估
- ✅ **知识管理系统**：量化概念、策略原理的间隔重复记忆

### 应用场景

| 场景 | 描述 | AI 模型 |
|------|------|---------|
| 技术分析 | K线图形态识别、技术指标分析 | GLM-4.5V + DeepSeek |
| 因子挖掘 | 量化因子构建、有效性检验 | Qwen-Math + DeepSeek |
| 策略开发 | 策略设计、代码实现、参数优化 | DeepSeek + Qwen-Math |
| 风险管理 | VaR计算、压力测试、归因分析 | Qwen-Math + DeepSeek |
| 知识学习 | 量化理论、金融工程概念学习 | 全模型 + Anki |

---

## 技术架构

### 系统组件

```
┌─────────────────────────────────────────────────────────────┐
│                    用户交互层                                │
│  Dify Web UI / Jupyter Notebook / Trading Terminal          │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│                  应用逻辑层 (Dify)                           │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐     │
│  │ 数据收集器   │  │ 分析引擎     │  │ 代码生成器   │     │
│  │ 多源数据API  │  │ 多模型路由   │  │ 策略实现     │     │
│  └──────────────┘  └──────────────┘  └──────────────┘     │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│                    AI 模型层                                 │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐        │
│  │ GLM-4.5V    │  │ Qwen-Math   │  │ DeepSeek-V3 │        │
│  │ 图表识别    │  │ 数学建模    │  │ 代码生成    │        │
│  │ ¥10/M tok  │  │ ¥2/M tokens │  │ ¥1/M tokens │        │
│  └─────────────┘  └─────────────┘  └─────────────┘        │
└─────────────────────────────────────────────────────────────┘
                              ↓
┌─────────────────────────────────────────────────────────────┐
│                  数据与工具层                                │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐  │
│  │市场数据  │  │回测引擎  │  │风险模型  │  │ Anki DB  │  │
│  │Tushare/  │  │Backtrader│  │RiskMetrics│ │知识库    │  │
│  │AkShare  │  │VectorBT  │  │ARCH/GARCH│  │记忆卡片  │  │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘  │
└─────────────────────────────────────────────────────────────┘
```

### 工作流架构

```
┌─────────────────────────────────────────────────────────────┐
│          Quantitative Finance AI Workflow v1.0              │
├─────────────────────────────────────────────────────────────┤
│                                                             │
│  ┌──────────┐  ┌──────────┐  ┌──────────┐  ┌──────────┐  │
│  │市场分析  │→│策略设计  │→│回测验证  │→│风险评估  │  │
│  │Market    │  │Strategy  │  │Backtest  │  │Risk      │  │
│  │Analysis  │  │Design    │  │& Verify  │  │Mgmt      │  │
│  └──────────┘  └──────────┘  └──────────┘  └──────────┘  │
│      ↓            ↓            ↓            ↓             │
│   GLM-4.5V    Qwen-Math    DeepSeek     Qwen-Math        │
│   (图表)      (数学)       (代码)       (风险)           │
│      ↓            ↓            ↓            ↓             │
│   DeepSeek    DeepSeek    回测引擎     风险模型          │
│   (技术分析)  (策略解释)  (性能评估)   (VaR/归因)        │
│      └────────────┴────────────┴────────────┘            │
│                        ↓                                  │
│              ┌──────────────────┐                         │
│              │ 知识卡片生成器   │                         │
│              │ Anki Generator   │                         │
│              └────────┬─────────┘                         │
│                       ↓                                  │
│              ┌──────────────────┐                         │
│              │ 量化知识库       │                         │
│              │ Anki Database    │                         │
│              └──────────────────┘                         │
└─────────────────────────────────────────────────────────────┘
```

---

## 核心功能模块

### 模块 1：智能市场分析

**功能描述**：
- K线图形态识别（头肩顶/底、双顶/双底、三角形等）
- 技术指标计算与解读（MA、MACD、RSI、布林带等）
- 支撑阻力位识别
- 趋势判断与预测

**输入**：
```yaml
数据输入:
  - 股票代码/交易对
  - K线图截图（可选）
  - 时间周期（日线/周线/月线）
  - 分析重点（趋势/形态/指标）
```

**输出**：
```json
{
  "trend_analysis": "上升趋势/下降趋势/震荡",
  "chart_patterns": ["双顶", "三角形整理"],
  "key_levels": {
    "support": [100.5, 98.2],
    "resistance": [105.8, 108.0]
  },
  "technical_indicators": {
    "MACD": "金叉，看涨信号",
    "RSI": "65，中性偏多",
    "Volume": "放量上涨"
  },
  "trading_signals": ["突破买入", "止损位置"],
  "confidence_score": 0.75
}
```

---

### 模块 2：量化策略设计

**功能描述**：
- 策略概念到数学模型的转换
- 因子构建与组合
- 择时、选股、配置模型
- 机器学习策略设计

**策略类型**：
1. **趋势跟踪策略**
   - 双均线系统
   - 突破策略
   - 动量策略

2. **均值回归策略**
   - 统计套利
   - 配对交易
   - 波动率策略

3. **多因子策略**
   - Fama-French 三因子
   - 动量因子
   - 质量因子

4. **机器学习策略**
   - LSTM 预测
   - 强化学习
   - 集成学习

**输入**：
```yaml
策略输入:
  策略类型: "多因子选股"
  标的池: "沪深300成分股"
  因子池: ["市值", "动量", "波动率", "估值"]
  回看周期: "3年"
  调仓频率: "月度"
```

**输出**：
```python
# 策略代码框架
class MultiFactorStrategy:
    def __init__(self):
        self.factors = ['momentum', 'value', 'quality']
        self.rebalance_freq = 'monthly'
        self.top_n = 50

    def calculate_factors(self, data):
        """因子计算"""
        factors = {}
        # 动量因子：过去12个月收益率
        factors['momentum'] = data['close'].pct_change(252)

        # 价值因子：市盈率倒数
        factors['value'] = 1 / data['pe_ratio']

        # 质量因子：ROE
        factors['quality'] = data['roe']

        return factors

    def rank_and_select(self, factors):
        """因子打分与选股"""
        scores = factors.mean(axis=1)
        return scores.nlargest(self.top_n).index

    def generate_positions(self, selected_stocks):
        """生成目标持仓"""
        positions = {}
        weight = 1 / len(selected_stocks)
        for stock in selected_stocks:
            positions[stock] = weight
        return positions
```

---

### 模块 3：回测与性能评估

**功能描述**：
- 历史数据回测
- 性能指标计算（夏普率、最大回撤、胜率等）
- 参数优化
- 过拟合检测

**性能指标**：
```python
# 核心性能指标
performance_metrics = {
    # 收益指标
    'total_return': 0.35,           # 总收益率
    'annual_return': 0.12,           # 年化收益
    'excess_return': 0.05,           # 超额收益

    # 风险指标
    'volatility': 0.15,              # 波动率
    'max_drawdown': -0.18,           # 最大回撤
    'var_95': -0.03,                 # 95% VaR

    # 风险调整收益
    'sharpe_ratio': 0.8,             # 夏普率
    'sortino_ratio': 1.2,            # 索提诺率
    'calmar_ratio': 0.67,            # 卡玛率
    'information_ratio': 0.5,        # 信息比率

    # 交易指标
    'win_rate': 0.55,                # 胜率
    'profit_factor': 1.8,            # 盈亏比
    'avg_trade_return': 0.008,       # 平均交易收益
    'trade_count': 156                # 交易次数
}
```

**回测报告**：
```
╔═══════════════════════════════════════════════════════════════╗
║                    回测性能报告                                 ║
╠═══════════════════════════════════════════════════════════════╣
║ 回测区间：2021-01-01 至 2023-12-31                              ║
║ 初始资金：¥1,000,000                                            ║
╠═══════════════════════════════════════════════════════════════╣
║ 策略表现                                                         ║
║ 总收益率：35.0%       年化收益率：12.0%                          ║
║ 基准收益率：20.0%     超额收益：15.0%                            ║
╠═══════════════════════════════════════════════════════════════╣
║ 风险指标                                                         ║
║ 波动率：15.0%         最大回撤：-18.0%                          ║
║ 夏普率：0.80           索提诺率：1.20                           ║
╠═══════════════════════════════════════════════════════════════╣
║ 交易统计                                                         ║
║ 交易次数：156          胜率：55%                                 ║
║ 平均收益：0.8%         盈亏比：1.8                              ║
╚═══════════════════════════════════════════════════════════════╝
```

---

### 模块 4：风险管理

**功能描述**：
- VaR（Value at Risk）计算
- 压力测试
- 归因分析
- 风险预算

**风险模型**：

**1. VaR 模型**
```python
# 历史模拟法
def historical_var(returns, confidence=0.95):
    """
    历史模拟法计算 VaR

    参数：
    - returns: 收益率序列
    - confidence: 置信水平（默认95%）

    返回：
    - VaR: 在险价值
    """
    return np.percentile(returns, (1 - confidence) * 100)

# 参数法（正态分布）
def parametric_var(returns, confidence=0.95):
    """
    参数法计算 VaR（假设收益率服从正态分布）

    VaR = μ - z_α × σ
    """
    mu = returns.mean()
    sigma = returns.std()
    z_score = stats.norm.ppf(1 - confidence)

    var = mu - z_score * sigma
    return var

# 蒙特卡洛模拟
def monte_carlo_var(returns, confidence=0.95, n_simulations=10000):
    """
    蒙特卡洛模拟计算 VaR
    """
    mu = returns.mean()
    sigma = returns.std()

    # 模拟未来收益率
    simulated_returns = np.random.normal(mu, sigma, n_simulations)

    # 计算 VaR
    var = np.percentile(simulated_returns, (1 - confidence) * 100)
    return var
```

**2. CVaR（条件VaR）**
```python
def cvar(returns, confidence=0.95):
    """
    条件VaR（Expected Shortfall）
    超过 VaR 的平均损失
    """
    var = historical_var(returns, confidence)
    return returns[returns <= var].mean()
```

**3. 最大回撤**
```python
def max_drawdown(prices):
    """
    计算最大回撤

    MDD = (峰值 - 谷值) / 峰值
    """
    cumulative = (1 + prices.pct_change()).cumprod()
    running_max = cumulative.expanding().max()
    drawdown = (cumulative - running_max) / running_max

    return drawdown.min()
```

**风险归因**：
```yaml
风险分解:
  - 系统性风险: 60%
  - 特质性风险: 25%
  - 模型风险: 10%
  - 流动性风险: 5%

行业暴露:
  - 金融: 25%
  - 科技: 30%
  - 消费: 20%
  - 其他: 25%

因子暴露:
  - 市场因子: 0.8
  - 规模因子: 0.3
  - 价值因子: -0.2
  - 动量因子: 0.5
```

---

### 模块 5：量化知识管理

**功能描述**：
- 量化概念卡片生成
- 公式推导卡片
- 策略原理卡片
- 编码技巧卡片

**卡片类型**：

**1. 概念卡片**
```yaml
正面: 什么是 Black-Scholes 期权定价模型？

背面:
Black-Scholes 模型是一种数学模型，用于计算欧式期权的理论价格。

核心假设：
1. 标的资产价格服从几何布朗运动
2. 无风险利率恒定
3. 标的资产不支付股息
4. 市场无摩擦（无交易成本、无税收）
5. 可以无限借贷

定价公式：
C = S₀N(d₁) - Ke^(-rT)N(d₂)

其中：
- C: 看涨期权价格
- S₀: 标的资产当前价格
- K: 行权价格
- r: 无风险利率
- T: 到期时间
- N(·): 标准正态分布的累积分布函数

局限性：
- 不适用于美式期权
- 不考虑股息支付
- 假设波动率恒定
```

**2. 公式卡片**
```yaml
正面: 推导夏普率公式

背面:
夏普率衡量每承担一单位总风险所获得的超额收益。

定义：
Sharpe Ratio = (R_p - R_f) / σ_p

推导过程：

1. 超额收益：
   E[R_p - R_f] = E[R_p] - R_f

2. 风险（标准差）：
   σ_p = sqrt(Var[R_p])

3. 风险调整收益：
   将超额收益除以风险

   Sharpe = (E[R_p] - R_f) / σ_p

直观理解：
- Sharpe > 1: 优秀
- Sharpe > 2: 非常优秀
- Sharpe > 3: 卓越

意义：
- 量化单位风险的收益
- 便于不同策略比较
- 考虑了无风险利率
```

**3. 代码卡片**
```yaml
正面: 实现滚动夏普率计算函数

背面:
```python
def rolling_sharpe(returns, window=252, risk_free_rate=0.03):
    """
    计算滚动夏普率

    参数：
    - returns: 日收益率序列
    - window: 滚动窗口（默认252个交易日）
    - risk_free_rate: 年化无风险利率

    返回：
    - 滚动夏普率序列
    """
    # 转换为日无风险利率
    daily_rf = risk_free_rate / 252

    # 计算滚动均值和标准差
    rolling_mean = returns.rolling(window).mean()
    rolling_std = returns.rolling(window).std()

    # 计算滚动夏普率
    rolling_sharpe = (rolling_mean - daily_rf) / rolling_std

    # 年化
    sharpe_annualized = rolling_sharpe * np.sqrt(252)

    return sharpe_annualized
```

使用示例：
```python
import pandas as pd

# 假设有收益率数据
returns = pd.Series([...])

# 计算252天滚动夏普率
sharpe_series = rolling_sharpe(returns)

# 可视化
sharpe_series.plot(title='Rolling Sharpe Ratio')
```

注意事项：
- 窗口选择影响结果
- 短期窗口：反应灵敏但噪声大
- 长期窗口：平滑但滞后
```

---

## 工作流设计

### 工作流 1：智能技术分析

```yaml
节点 1: 输入节点
输入变量:
  symbol: "AAPL"  # 股票代码
  chart_image: [K线图截图]
  timeframe: "daily"  # 时间周期
  focus: "trend"  # 分析重点

节点 2: 图表识别器 (GLM-4.5V)
提示词:
"""
你是专业的技术分析师。分析这张K线图。

图片：{{#start.chart_image#}}

请识别：
1. 图表形态（头肩顶/底、双顶/双底、三角形等）
2. 趋势方向（上升/下降/震荡）
3. 关键价格位（支撑/阻力）
4. 成交量特征
5. 技术信号（买入/卖出/观望）

请详细说明你的分析过程。
"""

节点 3: 技术指标计算 (代码执行)
代码:
```python
import pandas as pd
import numpy as np
import talib

def calculate_indicators(prices):
    """计算常用技术指标"""

    # 移动平均线
    prices['MA5'] = talib.MA(prices['close'], timeperiod=5)
    prices['MA20'] = talib.MA(prices['close'], timeperiod=20)
    prices['MA60'] = talib.MA(prices['close'], timeperiod=60)

    # MACD
    macd, signal, hist = talib.MACD(prices['close'])
    prices['MACD'] = macd
    prices['MACD_Signal'] = signal
    prices['MACD_Hist'] = hist

    # RSI
    prices['RSI'] = talib.RSI(prices['close'], timeperiod=14)

    # 布林带
    upper, middle, lower = talib.BBANDS(prices['close'])
    prices['BB_Upper'] = upper
    prices['BB_Middle'] = middle
    prices['BB_Lower'] = lower

    # 成交量指标
    prices['Volume_MA'] = talib.MA(prices['volume'], timeperiod=20)

    return prices

# 获取数据（示例）
# 实际应用中连接数据源
data = get_price_data(symbol)
indicators = calculate_indicators(data)

return indicators
```

节点 4: 综合分析 (DeepSeek-V3)
输入:
  - GLM-4.5V 的图表识别结果
  - 技术指标计算结果

提示词:
"""
你是资深的技术分析师。综合以下信息，给出完整的技术分析报告。

图表识别结果：
{{#chart_recognizer.result#}}

技术指标：
{{#indicator_calculator.result#}}

请生成包含以下内容的分析报告：

1. 趋势判断
2. 关键价位（支撑/阻力）
3. 技术指标解读
4. 交易信号
5. 风险提示
6. 操作建议

请给出具体的价位和止损位置。
"""

节点 5: 知识卡片生成
生成内容：
- 技术指标原理卡片
- 图表形态识别卡片
- 交易策略卡片
```

---

### 工作流 2：量化策略开发

```yaml
节点 1: 策略定义
输入变量:
  strategy_type: "multi_factor"  # 策略类型
  universe: "沪深300"  # 股票池
  factors: ["momentum", "value", "quality"]  # 因子列表
  rebalance_freq: "monthly"  # 调仓频率

节点 2: 因子数学建模 (Qwen-Math)
提示词:
"""
你是量化金融专家。设计一个多因子选股模型。

策略参数：
- 股票池：{{#start.universe#}}
- 因子：{{#start.factors#}}
- 调仓频率：{{#start.rebalance_freq#}}

请提供：

1. 因子定义与计算公式
2. 因子标准化方法（Z-score、Rank等）
3. 因子加权方案（等权、IC加权、最优化加权）
4. 风险控制模型（行业中性、风格中性）
5. 因子有效性检验方法

请给出完整的数学公式和推导过程。
"""

节点 3: 策略代码生成 (DeepSeek-V3)
输入:
  - Qwen-Math 的数学模型

提示词:
"""
你是 Python 量化开发专家。基于以下数学模型，实现完整的交易策略。

数学模型：
{{#math_model.result#}}

请生成：

1. 因子计算函数
2. 因子合成与打分函数
3. 选股与权重分配函数
4. 回测框架接口
5. 性能分析函数

要求：
- 使用 pandas/numpy
- 代码模块化
- 添加详细注释
- 包含使用示例
"""

输出:
```python
# 因子计算模块
import pandas as pd
import numpy as np

class FactorCalculator:
    """量化因子计算器"""

    @staticmethod
    def momentum_factor(price_data, period=252):
        """
        动量因子

        M_t = (P_t - P_{t-n}) / P_{t-n}

        其中：
        - P_t: 当前价格
        - P_{t-n}: n期前价格
        """
        return price_data.pct_change(period)

    @staticmethod
    def value_factor(market_cap, pe_ratio):
        """
        价值因子

        综合考虑：
        - 市值因子的倒数（小市值偏好）
        - 市盈率的倒数（低估值偏好）
        """
        # 标准化
        mc_inv = 1 / market_cap
        pe_inv = 1 / pe_ratio

        # Z-score标准化
        mc_z = (mc_inv - mc_inv.mean()) / mc_inv.std()
        pe_z = (pe_inv - pe_inv.mean()) / pe_inv.std()

        # 等权合成
        value_factor = (mc_z + pe_z) / 2

        return value_factor

    @staticmethod
    def quality_factor(roe, roa, debt_ratio):
        """
        质量因子

        综合考虑：
        - ROE（净资产收益率）
        - ROA（总资产收益率）
        - 负债率（倒数）
        """
        # 标准化
        roe_z = (roe - roe.mean()) / roe.std()
        roa_z = (roa - roa.mean()) / roa.std()
        debt_z = ((1/debt_ratio) - (1/debt_ratio).mean()) / (1/debt_ratio).std()

        # 等权合成
        quality_factor = (roe_z + roa_z + debt_z) / 3

        return quality_factor


# 多因子策略实现
class MultiFactorStrategy:
    """多因子选股策略"""

    def __init__(self, factors, top_n=50):
        """
        参数：
        - factors: 因子列表 ['momentum', 'value', 'quality']
        - top_n: 选股数量
        """
        self.factors = factors
        self.top_n = top_n
        self.calculator = FactorCalculator()

    def calculate_all_factors(self, data):
        """计算所有因子"""
        factor_data = {}

        for factor in self.factors:
            if factor == 'momentum':
                factor_data[factor] = self.calculator.momentum_factor(
                    data['close']
                )
            elif factor == 'value':
                factor_data[factor] = self.calculator.value_factor(
                    data['market_cap'],
                    data['pe_ratio']
                )
            elif factor == 'quality':
                factor_data[factor] = self.calculator.quality_factor(
                    data['roe'],
                    data['roa'],
                    data['debt_ratio']
                )

        return pd.DataFrame(factor_data)

    def composite_score(self, factor_data):
        """
        因子合成得分

        方法：等权加权因子得分
        """
        # 每个因子已经标准化，直接等权平均
        scores = factor_data.mean(axis=1)

        return scores

    def select_stocks(self, scores):
        """选股"""
        # 选择得分最高的 N 只股票
        selected = scores.nlargest(self.top_n)

        return selected.index.tolist()

    def generate_positions(self, selected_stocks):
        """生成目标持仓"""
        # 等权配置
        weight = 1 / len(selected_stocks)

        positions = {stock: weight for stock in selected_stocks}

        return positions


# 使用示例
if __name__ == "__main__":
    # 初始化策略
    strategy = MultiFactorStrategy(
        factors=['momentum', 'value', 'quality'],
        top_n=50
    )

    # 计算因子
    factor_data = strategy.calculate_all_factors(data)

    # 因子合成
    scores = strategy.composite_score(factor_data)

    # 选股
    selected = strategy.select_stocks(scores)

    # 生成持仓
    positions = strategy.generate_positions(selected)

    print(f"选中的股票：{selected}")
    print(f"目标持仓：{positions}")
```

节点 4: 回测框架集成
代码:
```python
import backtrader as bt

class MultiFactorStrategyBT(bt.Strategy):
    """Backtrader 策略实现"""

    def __init__(self):
        self.factor_strategy = MultiFactorStrategy(
            factors=self.params.factors,
            top_n=self.params.top_n
        )

    def next(self):
        """每月第一个交易日调仓"""
        if self.datetime._date.month != self._last_month:
            # 获取数据
            data = self.get_factor_data()

            # 计算因子并选股
            selected = self.factor_strategy.select_stocks(data)

            # 调仓
            self.rebalance(selected)

            self._last_month = self.datetime._date.month
```

节点 5: 性能评估
代码:
```python
def evaluate_backtest(results):
    """评估回测结果"""

    metrics = {
        # 收益指标
        'total_return': calculate_total_return(results),
        'annual_return': calculate_annual_return(results),
        'monthly_returns': results.resample('M').last(),

        # 风险指标
        'volatility': results.pct_change().std() * np.sqrt(252),
        'max_drawdown': calculate_max_drawdown(results),
        'var_95': results.pct_change().quantile(0.05),

        # 风险调整收益
        'sharpe_ratio': calculate_sharpe(results),
        'sortino_ratio': calculate_sortino(results),
        'calmar_ratio': calculate_calmar(results),

        # 交易统计
        'trade_count': len(results['trades']),
        'win_rate': calculate_win_rate(results),
        'profit_factor': calculate_profit_factor(results),
    }

    return metrics
```

节点 6: 知识卡片生成
生成卡片：
- 因子定义卡片
- 策略原理卡片
- 代码实现卡片
```

---

### 工作流 3：风险管理系统

```yaml
节点 1: 风险输入
输入变量:
  portfolio: "持仓组合（股票+权重）"
  confidence: 0.95  # 置信水平
  horizon: 1  # 持有期（天）

节点 2: VaR 计算 (Qwen-Math)
提示词:
"""
你是风险管理专家。解释并实现 VaR 模型。

参数：
- 置信水平：{{#start.confidence#}}
- 持有期：{{#start.horizon#}} 天

请提供：

1. VaR 的数学定义
2. 三种计算方法的推导：
   - 历史模拟法
   - 参数法（正态分布）
   - 蒙特卡洛模拟

3. 每种方法的优缺点
4. 适用场景
5. Python 实现代码

请详细说明数学原理和实现细节。
"""

节点 3: 风险计算 (代码执行)
代码:
```python
import numpy as np
import pandas as pd
from scipy import stats

class RiskCalculator:
    """风险计算器"""

    def __init__(self, returns, confidence=0.95):
        """
        参数：
        - returns: 收益率序列
        - confidence: 置信水平
        """
        self.returns = returns
        self.confidence = confidence

    def historical_var(self):
        """历史模拟法 VaR"""
        var = np.percentile(
            self.returns,
            (1 - self.confidence) * 100
        )
        return var

    def parametric_var(self):
        """参数法 VaR（正态分布）"""
        mu = self.returns.mean()
        sigma = self.returns.std()
        z_score = stats.norm.ppf(1 - self.confidence)

        var = mu - z_score * sigma
        return var

    def monte_carlo_var(self, n_simulations=10000):
        """蒙特卡洛模拟 VaR"""
        mu = self.returns.mean()
        sigma = self.returns.std()

        # 模拟未来收益率
        simulated = np.random.normal(
            mu, sigma, n_simulations
        )

        # 计算 VaR
        var = np.percentile(
            simulated,
            (1 - self.confidence) * 100
        )
        return var

    def cvar(self):
        """条件VaR（Expected Shortfall）"""
        var = self.historical_var()

        # 超过 VaR 的平均损失
        cvar = self.returns[self.returns <= var].mean()

        return cvar

    def max_drawdown(self, prices):
        """最大回撤"""
        cumulative = (1 + self.returns).cumprod()
        running_max = cumulative.expanding().max()
        drawdown = (cumulative - running_max) / running_max

        return drawdown.min()

    def volatility(self, annualize=True):
        """波动率"""
        vol = self.returns.std()

        if annualize:
            vol *= np.sqrt(252)

        return vol

    def beta(self, portfolio_returns, market_returns):
        """Beta（系统性风险）"""
        covariance = np.cov(portfolio_returns, market_returns)[0, 1]
        market_variance = np.var(market_returns)

        beta = covariance / market_variance
        return beta
```

节点 4: 压力测试 (DeepSeek-V3)
提示词:
"""
你是风险专家。设计压力测试方案。

投资组合：
{{#start.portfolio#}}

请提供：

1. 压力场景设计（历史危机 + 假设场景）
2. 每个场景下的组合损失估算
3. 最坏情景分析
4. 风险缓释建议

压力场景类型：
- 2008 金融危机重演
- 2020 疫情暴跌
- 极端利率波动
- 行业黑天鹅
"""

节点 5: 风险归因 (代码执行)
代码:
```python
class RiskAttribution:
    """风险归因分析"""

    def factor_attribution(self, returns, factor_returns):
        """
        因子归因

        R_p = Σ β_i × F_i + α

        其中：
        - R_p: 组合收益
        - β_i: 因子暴露
        - F_i: 因子收益
        - α: 特质性收益
        """
        from sklearn.linear_model import LinearRegression

        model = LinearRegression()
        model.fit(factor_returns, returns)

        # 因子贡献
        factor_contributions = model.coef_ * factor_returns.mean()

        attribution = {
            'factor_betas': model.coef_,
            'factor_contributions': factor_contributions,
            'alpha': model.intercept_,
            'r_squared': model.score(factor_returns, returns)
        }

        return attribution

    industry_attribution(self, returns, industry_returns):
        """
        行业归因

        计算每个行业对组合风险的贡献
        """
        # 计算行业暴露
        total_var = returns.var()
        industry_contrib = {}

        for industry, ind_returns in industry_returns.items():
            cov = np.cov(returns, ind_returns)[0, 1]
            contrib = cov / total_var
            industry_contrib[industry] = contrib

        return industry_contrib
```

节点 6: 风险报告生成 (DeepSeek-V3)
提示词:
"""
生成风险管理报告。

输入数据：
- VaR: {{#risk_calculator.var#}}
- CVaR: {{#risk_calculator.cvar#}}
- 最大回撤: {{#risk_calculator.max_dd#}}
- 波动率: {{#risk_calculator.volatility#}}
- 因子归因: {{#risk_attribution.factor#}}

请生成包含以下内容的专业报告：

1. 风险概览（仪表盘）
2. 风险指标解读
3. 风险来源分析
4. 压力测试结果
5. 风险限额检查
6. 风险缓释建议

格式：专业、清晰、可操作
"""

节点 7: 知识卡片生成
生成卡片：
- 风险模型原理卡片
- VaR 计算方法卡片
- 风险归因概念卡片
```

---

## 数据集成

### 数据源配置

**1. 免费数据源**

```python
# Tushare（需要积分）
import tushare as ts

# 注册并获取 token
# https://tushare.pro/register
ts.set_token('your_token_here')
pro = ts.pro_api()

# 获取股票日线数据
df = pro.daily(
    ts_code='000001.SZ',
    start_date='20200101',
    end_date='20231231'
)

# 获取财务数据
df = pro.income(
    ts_code='000001.SZ',
    start_date='20200101',
    end_date='20231231'
)
```

```python
# AkShare（完全免费）
import akshare as ak

# 获取股票日线数据
df = ak.stock_zh_a_hist(
    symbol="000001",
    period="daily",
    start_date="20200101",
    end_date="20231231",
    adjust="qfq"  # 前复权
)

# 获取实时行情
df = ak.stock_zh_a_spot_em()

# 获取财务数据
df = ak.stock_financial_analysis_indicator(symbol="000001")

# 获取宏观经济数据
df = ak.macro_china_gdp()
```

```python
# yfinance（国际市场）
import yfinance as yf

# 下载美股数据
data = yf.download(
    'AAPL',
    start='2020-01-01',
    end='2023-12-31'
)

# 获取期权数据
ticker = yf.Ticker('AAPL')
options = ticker.option_chain()
```

**2. 数据存储方案**

```python
# 使用 SQLite 存储历史数据
import sqlite3
import pandas as pd

class DataStorage:
    """数据存储管理器"""

    def __init__(self, db_path='quant_data.db'):
        self.conn = sqlite3.connect(db_path)

    def save_prices(self, df, table_name='stock_prices'):
        """保存价格数据"""
        df.to_sql(
            table_name,
            self.conn,
            if_exists='append',
            index=False
        )

    def load_prices(
        self,
        symbol,
        start_date,
        end_date,
        table_name='stock_prices'
    ):
        """加载价格数据"""
        query = f"""
        SELECT * FROM {table_name}
        WHERE symbol = '{symbol}'
        AND date BETWEEN '{start_date}' AND '{end_date}'
        ORDER BY date
        """

        df = pd.read_sql(query, self.conn)
        return df
```

### 实时数据流

```python
# WebSocket 实时行情
import websocket
import json

class RealTimeDataFeed:
    """实时数据推送"""

    def __init__(self, on_data_callback):
        self.on_data = on_data_callback
        self.ws = None

    def connect(self, url):
        """连接 WebSocket"""
        self.ws = websocket.WebSocketApp(
            url,
            on_message=self.on_message,
            on_error=self.on_error,
            on_close=self.on_close,
            on_open=self.on_open
        )
        self.ws.run_forever()

    def on_message(self, ws, message):
        """处理消息"""
        data = json.loads(message)
        self.on_data(data)

    def subscribe(self, symbols):
        """订阅股票代码"""
        subscription = {
            "action": "subscribe",
            "symbols": symbols
        }
        self.ws.send(json.dumps(subscription))
```

---

## 部署指南

### Phase 1：环境准备

```bash
# 1. 安装 Python 依赖
pip install pandas numpy scipy
pip install backtrader vectorbt
pip install akshare yfinance tushare
pip install talib
pip install scikit-learn

# 2. 安装 TA-Lib（技术指标库）
# macOS
brew install ta-lib

# Ubuntu/Debian
wget http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz
tar -xzf ta-lib-0.4.0-src.tar.gz
cd ta-lib
./configure --prefix=/usr
make
sudo make install

# 3. 启动 Dify
cd /Users/berton/Github/dify/docker
docker compose up -d
```

---

### Phase 2：工作流配置

**1. 创建量化分析应用**
- 访问 http://localhost
- 创建新工作流应用
- 命名为"量化金融 AI 分析系统"

**2. 配置模型提供商**
- DeepSeek: 代码生成、策略解释
- Qwen-Math: 数学建模、风险计算
- GLM-4.5V: 图表识别、报告分析

**3. 创建工作流**
按照上面的工作流设计，创建三个主要工作流：
- 智能技术分析
- 量化策略开发
- 风险管理系统

---

### Phase 3：数据连接

**1. 配置数据源**
```python
# config.py
class Config:
    """数据源配置"""

    # Tushare
    TUSHARE_TOKEN = 'your_token_here'

    # 数据库
    DB_PATH = 'quant_data.db'

    # 实时数据
    WEBSOCKET_URL = 'wss://api.example.com/stream'

    # API Keys
    ALPHA_VANTAGE_KEY = 'your_key'
    POLYGON_IO_KEY = 'your_key'
```

**2. 创建数据管道**
```python
# data_pipeline.py
class DataPipeline:
    """数据采集管道"""

    def __init__(self):
        self.storage = DataStorage()

    def update_daily_data(self, symbols):
        """更新日线数据"""
        for symbol in symbols:
            # 获取数据
            data = ak.stock_zh_a_hist(symbol=symbol)

            # 存储数据
            self.storage.save_prices(data)

    def update_fundamentals(self, symbols):
        """更新基本面数据"""
        for symbol in symbols:
            # 获取财务数据
            data = ak.stock_financial_analysis_indicator(symbol)

            # 存储数据
            self.storage.save_fundamentals(data)
```

---

## 使用场景

### 场景 1：A股技术分析

```
输入配置：
- 股票代码：600519.SH（贵州茅台）
- K线图：[上传截图]
- 分析周期：日线
- 分析重点：趋势 + 形态

GLM-4.5V 分析：
- 识别：W底形态形成
- 突破：颈线位 ¥1800
- 成交量：放量突破
- 趋势：中期上升趋势

DeepSeek 补充：
- 技术指标：MACD金叉，RSI 58
- 支撑位：¥1750，阻力位：¥1900
- 交易建议：突破后追涨，止损 ¥1750

生成知识卡片：
- W底形态原理
- MACD指标解读
- 止损设置技巧
```

---

### 场景 2：多因子策略开发

```
输入配置：
- 策略类型：多因子选股
- 股票池：沪深300
- 因子池：动量、价值、质量
- 调仓频率：月度

Qwen-Math 建模：
- 因子定义与公式
- 标准化方法（Z-score）
- 加权方案（等权/IC加权）
- 风险模型（行业中性）

DeepSeek 生成代码：
- 因子计算函数
- 因子合成逻辑
- 选股与权重分配
- 回测框架接口

回测结果（3年）：
- 年化收益：15.2%
- 最大回撤：-12.5%
- 夏普率：1.05
- 超额收益：8.3%

生成知识卡片：
- 多因子模型原理
- IC/IR指标概念
- 风险模型方法
```

---

### 场景 3：组合风险管理

```
输入配置：
- 组合持仓：50只股票
- 置信水平：95%
- 持有期：10天

Qwen-Math 计算：
- VaR 数学原理
- 三种计算方法
- 协方差矩阵估计
- 蒙特卡洛模拟设计

Python 实现：
- 历史模拟法 VaR：-3.2%
- 参数法 VaR：-3.5%
- 蒙特卡洛 VaR：-3.4%
- CVaR：-5.1%

风险归因：
- 系统性风险：70%
- 行业风险：15%
- 特质性风险：15%

压力测试：
- 2008危机情景：-25%
- 2020疫情情景：-18%
- 极端利率情景：-12%

生成知识卡片：
- VaR/CVaR概念
- 风险归因方法
- 压力测试原理
```

---

## 成本分析

### 详细成本分解

| 任务类型 | 主用模型 | 输入tokens | 输出tokens | 单次成本 | 月度使用 | 月成本 |
|---------|---------|-----------|-----------|---------|---------|--------|
| 图表分析 | GLM-4.5V | 2000 | 1000 | ¥0.03 | 20次 | ¥0.60 |
| 技术分析 | DeepSeek | 1500 | 1000 | ¥0.0035 | 50次 | ¥0.18 |
| 策略建模 | Qwen-Math | 3000 | 2000 | ¥0.018 | 10次 | ¥0.18 |
| 代码生成 | DeepSeek | 2000 | 3000 | ¥0.008 | 15次 | ¥0.12 |
| 风险计算 | Qwen-Math | 1500 | 1000 | ¥0.005 | 10次 | ¥0.05 |
| **总计** | - | - | - | - | **105次** | **¥1.13/月** |

### 年度成本预估

- **轻度使用**（每周分析2-3次）：¥50-80/年
- **中度使用**（每日分析1-2次）：¥150-200/年
- **重度使用**（专业量化研究）：¥500-800/年

### 成本对比

| 方式 | 成本/年 | 数据质量 | 分析深度 | 定制化 |
|------|--------|---------|---------|--------|
| Wind/同花顺 | ¥30,000+ | 高 | 中 | 低 |
| 量化平台 | ¥100,000+ | 高 | 高 | 中 |
| 自研系统 | ¥500,000+ | 自定 | 自定 | 高 |
| **AI量化系统** | **¥100-800** | **高** | **高** | **极高** |

---

## 最佳实践

### 1. 数据管理

- **数据质量检查**：缺失值、异常值、一致性
- **数据存储**：时序数据库（InfluxDB、TimescaleDB）
- **数据版本控制**：DVC、Delta Lake
- **实时监控**：数据延迟、覆盖率监控

### 2. 模型开发

- **模块化设计**：因子计算、组合构建、执行分离
- **参数化配置**：避免硬编码
- **版本管理**：Git标签记录每个策略版本
- **文档完善**：每个函数的详细注释

### 3. 回测验证

- **样本外测试**：避免过拟合
- **交易成本**：考虑手续费、滑点、冲击成本
- **流动性约束**：实际可交易性检查
- **稳健性检验**：参数敏感性分析

### 4. 风险控制

- **多维度风控**：风险限额、止损、分散化
- **实时监控**：组合暴露、杠杆、VaR
- **压力测试**：定期模拟极端情景
- **归因分析**：持续追踪收益/风险来源

### 5. 知识积累

- **每日复习**：Anki量化概念卡片
- **策略总结**：每次回测后的经验教训
- **错误记录**：失败案例及原因分析
- **前沿追踪**：论文、博客、会议

---

## 进阶功能

### 1. 机器学习策略

```python
# LSTM 价格预测
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import LSTM, Dense

def build_lstm_model(input_shape):
    """构建LSTM模型"""
    model = Sequential([
        LSTM(50, return_sequences=True,
             input_shape=input_shape),
        LSTM(50, return_sequences=False),
        Dense(25),
        Dense(1)
    ])

    model.compile(
        optimizer='adam',
        loss='mse'
    )

    return model

# 训练与预测
model = build_lstm_model((X_train.shape[1], X_train.shape[2]))
model.fit(X_train, y_train, epochs=50, batch_size=32)

predictions = model.predict(X_test)
```

### 2. 强化学习交易

```python
# DQN 交易agent
import stable_baselines3 as sb3
from stable_baselines3.common.vec_env import DummyVecEnv

from trading_env import TradingEnv  # 自定义环境

# 创建环境
env = TradingEnv(data)
env = DummyVecEnv([lambda: env])

# 训练DQN
model = sb3.DQN(
    "MlpPolicy",
    env,
    verbose=1
)

model.learn(total_timesteps=100000)

# 测试
obs = env.reset()
for _ in range(1000):
    action, _states = model.predict(obs)
    obs, rewards, done, info = env.step(action)
```

### 3. 因子挖掘自动化

```python
# 自动因子发现
from sklearn.ensemble import RandomForestRegressor
from sklearn.feature_selection import mutual_info_regression

class AutoFactorMining:
    """自动因子挖掘"""

    def __init__(self):
        self.models = {}
        self.factor_importance = {}

    def generate_candidates(self, data):
        """生成候选因子"""
        candidates = {
            'momentum_5d': data['close'].pct_change(5),
            'momentum_20d': data['close'].pct_change(20),
            'volatility_20d': data['close'].pct_change().rolling(20).std(),
            'volume_ratio': data['volume'] / data['volume'].rolling(20).mean(),
            # ... 更多候选因子
        }
        return pd.DataFrame(candidates)

    def evaluate_importance(self, factors, returns):
        """评估因子重要性"""
        mi_scores = mutual_info_regression(
            factors.fillna(0),
            returns
        )

        importance = pd.Series(
            mi_scores,
            index=factors.columns
        ).sort_values(ascending=False)

        return importance

    def select_factors(self, importance, top_n=10):
        """选择最优因子"""
        return importance.head(top_n).index.tolist()
```

### 4. 实时监控系统

```python
# 实时风险监控
import schedule
import time

class RiskMonitor:
    """实时风险监控系统"""

    def __init__(self, portfolio, limits):
        self.portfolio = portfolio
        self.limits = limits

    def check_var_limit(self):
        """检查VaR限额"""
        current_var = self.portfolio.calculate_var()

        if current_var > self.limits['max_var']:
            self.alert(
                f"VaR超限！当前: {current_var:.2%}, "
                f"限额: {self.limits['max_var']:.2%}"
            )

    def check_concentration(self):
        """检查集中度"""
        max_weight = self.portfolio.weights.max()

        if max_weight > self.limits['max_concentration']:
            self.alert(
                f"集中度超限！{max_weight:.2%} > "
                f"{self.limits['max_concentration']:.2%}"
            )

    def run(self):
        """运行监控"""
        schedule.every(1).hour.do(self.check_var_limit)
        schedule.every(30).minutes.do(self.check_concentration)

        while True:
            schedule.run_pending()
            time.sleep(60)
```

---

## 附录

### A. 量化金融资源

**在线课程**：
- QuantConnect Academy
- Quantopian Lectures（已归档，但内容仍有价值）
- Financial Engineering Course (Columbia FE)

**书籍推荐**：
- 《量化投资：策略与技术》- 丁鹏
- 《Active Portfolio Management》- Grinold & Kahn
- 《Options, Futures, and Other Derivatives》- John Hull
- 《Algorithmic Trading》- Ernie Chan

**开源项目**：
- Backtrader: 回测框架
- VectorBT: 快速回测
- QuantLib: 定价库
- Zipline: Quantopian开源的回测引擎

**数据源**：
- 免费：Tushare、AkShare、yfinance
- 付费：Wind、Bloomberg、Choice

---

### B. Anki 牌组模板

```
Quantitative Finance (父牌组)
├── Concepts (基础概念)
│   ├── Market Microstructure (市场微观结构)
│   ├── Portfolio Theory (组合理论)
│   ├── Derivatives (衍生品)
│   └── Risk Management (风险管理)
├── Models (定价模型)
│   ├── Black-Scholes (BS模型)
│   ├── Binomial Tree (二叉树)
│   ├── Monte Carlo (蒙特卡洛)
│   └── Heston Model (随机波动率)
├── Strategies (策略)
│   ├── Momentum (动量)
│   ├── Mean Reversion (均值回归)
│   ├── Statistical Arbitrage (统计套利)
│   └── Pairs Trading (配对交易)
├── Indicators (技术指标)
│   ├── Trend (趋势)
│   ├── Momentum (动量)
│   ├── Volatility (波动率)
│   └── Volume (成交量)
├── Code Snippets (代码片段)
│   ├── Factor Calculation (因子计算)
│   ├── Backtesting (回测)
│   ├── Risk Metrics (风险指标)
│   └── Optimization (优化)
└── Formulas (数学公式)
    ├── Derivation (推导过程)
    ├── Implementation (实现)
    └── Intuition (直观理解)
```

---

### C. 更新日志

- **v1.0** (2025-01-03): 初始版本，包含完整的量化金融AI分析系统

---

*本文档由 Claude Code + Happy 自动生成和维护*
*最后更新：2025-01-03*
