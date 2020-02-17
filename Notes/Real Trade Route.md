#关于Real Trade Route的一些想法
制作一个真实商路mod，使得商路可以根据两个城市的远近，资源的互补获得加成，以此增强游戏地缘政治属性。

商路相关的全局参数，可见商路收益与距离无关，只与目标城市和开始城市的区域数量、贸易站数量有关。
```xml
<Replace Name="AI_TURNS_BETWEEN_TRADES" Value="10" />
<Replace Name="RELIGION_SPREAD_TRADE_ROUTE_PRESSURE_FOR_DESTINATION" Value="1.0" />
<Replace Name="RELIGION_SPREAD_TRADE_ROUTE_PRESSURE_FOR_ORIGIN" Value="0.5" />
<Replace Name="TOURISM_TRADE_ROUTE_BONUS" Value="25" />
<Replace Name="TRADE_ROUTE_BASE_RANGE" Value="15" />
<Replace Name="TRADE_ROUTE_GOLD_PER_DESTINATION_DISTRICT" Value="2" />
<Replace Name="TRADE_ROUTE_GOLD_PER_ORIGIN_DISTRICT" Value="2" />
<Replace Name="TRADE_ROUTE_LAND_RANGE_REFUEL" Value="15" />
<Replace Name="TRADE_ROUTE_PLACES_ROADS" Value="true" />
<Replace Name="TRADE_ROUTE_TURN_DURATION_BASE" Value="20" />
<Replace Name="TRADE_ROUTE_WATER_RANGE_REFUEL" Value="30" />
<Replace Name="TRADING_POST_GOLD_IN_FOREIGN_CITY" Value="1" />
<Replace Name="TRADING_POST_GOLD_IN_OWN_CITY" Value="0" />
```
区域收益如下：
![](https://i.imgur.com/0yED8JG.png)

## 功能1：根据路程提供金币加成
###功能描述：
- 路程越远，金币加成越高

###实现方法：
1. 获取商路连接的两个城市
```lua
local trade:table = m_selectedUnit:GetTrade();
local prevOriginComponentID:table = trade:GetLastOriginTradeCityComponentID();
local prevDestComponentID:table = trade:GetLastDestinationTradeCityComponentID();
```
获取商路的信息：
```lua
local pathPlots:table = {};
pathPlots, portalEntrances, portalExits = tradeManager:GetTradeRoutePath(m_originCityOwner, m_originCityID, cityOwner, cityID );
```
GetTradeManager的用法：
![](https://i.imgur.com/oihBbGZ.png)
2. 然后根据城市坐标计算城市之间的直线距离（如果有办法直接获取商路的距离就更好了）
获取两个坐标的距离的方法：
`Map.GetPlotDistance(x1, y1, x2, y2)`-距离包含首尾格位在内。
3. 然后给商路所在的城市（不知道商路可不可以绑定修改器）绑定一个加商路金币的修改器。首先在数据库中创建一个 ModifierId，然后在 lua 中绑定：
```lua
pPlayer:AttachModifierByID(ModifierId)
pCity:AttachModifierByID(ModifierId)
```
4. 最后当商路结束的时候，移除这个修改器。

## 功能2：根据资源互补加成
###功能描述：
- 城市互通有无，当终点城市缺少发起城市的资源时，给予发起城市额外的金币加成

###实现方法：
2. 根据资源的类型，给商路添加不同的加成。可以在现成的数据库`Resource_TradeRouteYields`里使用sql语言插入。参数分别是：`(ResourceType, YieldType, YieldChange)`

