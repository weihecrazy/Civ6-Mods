# 瘟疫mod

想法：移植黑死病情景的功能，做成一种紧急状态？

DLC：BlackDeathScenario

触发机制：与人口/住房成正比，可随机发生在市中心或港口，触发后以触发点为中心，向周围单元格蔓延，移动力（待考虑）

建筑：下水道，降低瘟疫发生的概率
      厕所，降低瘟疫发生的概率

科技：医学，卫生学

政策：

项目：套用援助项目的模板，项目可加速疫苗的开发。

政策卡：公民隔离，降低瘟疫传播速度

单位：学者，瘟疫医师

## DLC中的modifier：

```xml
<Types>
<!-- Modifiers -->
    <Row Type="MODIFIER_SCENARIO_ADJUST_BUILDINGS_PURCHASE_COST" Kind="KIND_MODIFIER"/>
<!-- Traits -->
    <Row Type="TRAIT_BLACKDEATH_SCENARIO_PLAYER_DIFFICULTY" Kind="KIND_TRAIT"/>
    <Row Type="TRAIT_BLACKDEATH_ENGLAND_TEXT_ONLY" Kind="KIND_TRAIT"/>
    <Row Type="TRAIT_BLACKDEATH_CASTILE_TEXT_ONLY" Kind="KIND_TRAIT"/>
    <Row Type="TRAIT_SCENARIO_UNIT_TEUTONIC_KNIGHT" Kind="KIND_TRAIT"/>
    <Row Type="TRAIT_SCENARIO_FAITH_WILDCARD_SLOT" Kind="KIND_TRAIT"/>
</Types>
<GlobalParameters>
    <Replace Name="DISABLE_TUTORIAL" Value="true"/>
    <Replace Name="UNLOCK_EMBARKATION" Value="true"/>
    <Replace Name="GOVERNMENT_ALLOW_EMPTY_POLICY_SLOTS" Value="true"/>
    <Replace Name="DIPLOMACY_WAR_LAST_FOREVER" Value="true"/>
    <Replace Name="PLOT_CONTAMINATION_DAMAGE_BASE" Value="20"/>
    <Replace Name="CITY_CENTER_TRAIN_WHEN_CONTAMINATED" Value="true"/>
    <Replace Name="CITY_GROWTH_EXPONENT" Value="2.5"/>
    <Replace Name="CITY_GROWTH_MULTIPLIER" Value="10"/>
    <Replace Name="CITY_GROWTH_THRESHOLD" Value="30"/>
    <Replace Name="CITIZEN_IDENTITY_PRESSURE_RADIUS_CUTOFF" Value="1"/>
    <Replace Name="DISTRICT_POPULATION_REQUIRED_PER" Value="2"/>
    <Replace Name="GOLD_PURCHASE_MULTIPLIER" Value="1.5"/>
</GlobalParameters>
```
## 核心内容：
1. 让城市被污染，并显示出污染的动画（完成）
2. 完善触发机制
3. 完善传播机制
4. 完善抑制机制
5. 完善清楚机制
----------------------------