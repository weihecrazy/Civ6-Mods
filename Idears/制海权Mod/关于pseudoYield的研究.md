表示AI的倾向，如PSEUDOYIELD_DISTRICT表示AI新建区域的倾向。  
原版游戏中AI新建区域的欲望为3.5,`<Row PseudoYieldType="PSEUDOYIELD_DISTRICT" DefaultValue="3.5"/>`  
而在风云变幻资料片中，AI新建区域的倾向更改为4，由下面游戏源文件中的注释可知，数值越高，对应的倾向也越大。
```xml
<!-- Too many things are competing with districts, and AI are not building enough, so increase that desire a bit -->
        <Update>
            <Where PseudoYieldType="PSEUDOYIELD_DISTRICT"/>
            <Set>
                <DefaultValue>4.0</DefaultValue>
            </Set>
        </Update>
```
而在`Yields.xml`文件中，空军单位的倾向为2，海军和陆军单位的倾向为1。
```xml
    <Row PseudoYieldType="PSEUDOYIELD_UNIT_COMBAT" DefaultValue="1.0"/>
    <Row PseudoYieldType="PSEUDOYIELD_UNIT_NAVAL_COMBAT" DefaultValue="1.0"/>
    <Row PseudoYieldType="PSEUDOYIELD_UNIT_AIR_COMBAT" DefaultValue="2.0"/>
```
这里假设应该为空军3，海军2，陆军1，则可以这样改：

```sql
UPDATE PseudoYields SET DefaultValue=3 WHERE PseudoYieldType="PSEUDOYIELD_UNIT_AIR_COMBAT"; 
UPDATE PseudoYields SET DefaultValue=2 WHERE PseudoYieldType="PSEUDOYIELD_UNIT_NAVAL_COMBAT"; 
```
在随机议程`AGENDA_AIRPOWER`中绑定了特性`TRAIT_AGENDA_PREFER_AIRPOWER`，在该特性中`PSEUDOYIELD_UNIT_AIR_COMBAT`+50：
```xml
<Row ListType="AirpowerLoverAirpowerPreference" Item="PSEUDOYIELD_UNIT_AIR_COMBAT" Value="50"/>
```
则拥有随机议程`AGENDA_AIRPOWER`的AI，他的空军倾向是50+2=52。在胜利倾向设置中，如果AI追求征服胜利，海陆空三种的倾向都会+25，则总的空军倾向为77。

```xml
<Row ListType="MilitaryVictoryPseudoYields" Item="PSEUDOYIELD_NUCLEAR_WEAPON" Value="25"/>
<Row ListType="MilitaryVictoryPseudoYields" Item="PSEUDOYIELD_UNIT_COMBAT" Value="25"/>
<Row ListType="MilitaryVictoryPseudoYields" Item="PSEUDOYIELD_UNIT_NAVAL_COMBAT" Value="25"/>
```
# 总结：这个值会和所有类型为PseudoYieldType的值进行比较，这个值可以为负数，也可以超过100，越大则表示倾向越大。