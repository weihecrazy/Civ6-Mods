新版的自动生成的FallbackLeaders.artdef文件，其m_XLPPath和m_BLPPackage均为带有Images后缀，与老版本的不同。
```xml
<Element class="AssetObjects..BLPEntryValue">
	<m_EntryName text="xxx"/>
	<m_XLPClass text="LeaderFallback"/>
	<m_XLPPath text="leaderfallbackImages.xlp"/>
	<m_BLPPackage text="LeaderFallbackImages"/>
	<m_LibraryName text="LeaderFallback"/>
	<m_ParamName text="BLP Entry"/>
</Element>
```
因此需要修改m_XLPPath和m_BLPPackage的text值，使其和你的xlp文件名对应。如，我的领袖xlp文件名为：LeaderFallbacks.xlp, Package name : LeaderFallbacks，则可以修改成下面的形式：
```xml
<Element class="AssetObjects..BLPEntryValue">
	<m_EntryName text="xxx"/>
	<m_XLPClass text="LeaderFallback"/>
	<m_XLPPath text="leaderfallbacks.xlp"/>
	<m_BLPPackage text="LeaderFallbacks"/>
	<m_LibraryName text="LeaderFallback"/>
	<m_ParamName text="BLP Entry"/>
</Element>
```
顺便提一句，领袖立绘，也就是加载界面和外交界面的图片最好是582*900分辨率。