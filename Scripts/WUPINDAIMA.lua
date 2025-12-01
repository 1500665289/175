local JYS = GameMain:GetMod("JYS");

local function AddCostItem(ItemName,CostItemName,CostItemCount)
	local ThingDef = CS.XiaWorld.ThingMgr.Instance:GetDef(CS.XiaWorld.g_emThingType.Item, ItemName);
	if not ThingDef then
		print("不存在的物品：" .. ItemName)
	end
	if not CS.XiaWorld.ThingMgr.Instance:GetDef(CS.XiaWorld.g_emThingType.Item, CostItemName) then
		print("不存在的需求物品：" .. CostItemName)
	end
	--修复重新加载存档导致的重复修改的bug。
	if ThingDef.Item and ThingDef.Item.BeMade and ThingDef.Item.BeMade.CostItems then
		for k,v in pairs(ThingDef.Item.BeMade.CostItems) do
			if v.name == CostItemName then
				return;
			end
		end
	end

	local newitem = CS.XiaWorld.ItemCostData()
	newitem.name = CostItemName;
	newitem.minlevel = 1;
	newitem.maxlevel = 9999;
	newitem.count = CostItemCount;

	if not ThingDef.Item then
		ThingDef.Item = CS.XiaWorld.ItemData();
	end
	--手动处理DrugBase子类别的BUG。检测 如果DrugBase的子类别的BeMade是一致的，重新创建一个空白的。
	if ThingDef.Parent == "DrugBase" then
		local ParentDef = CS.XiaWorld.ThingMgr.Instance:GetDef(CS.XiaWorld.g_emThingType.Item, "DrugBase");
		if ThingDef.Item.BeMade == ParentDef.Item.BeMade then
			ThingDef.Item.BeMade = CS.XiaWorld.ThingBeMadeData();
			ThingDef.Item.BeMade.WorkToMake = 100;
			ThingDef.Item.BeMade.CostStuffCount = 0;
		end
	end
	
	if not ThingDef.Item.BeMade then
		ThingDef.Item.BeMade = CS.XiaWorld.ThingBeMadeData();
	end
	if not ThingDef.Item.BeMade.CostItems then
		ThingDef.Item.BeMade.CostItems = CS.System.Collections.Generic["List`1[XiaWorld.ItemCostData]"]()
	end
	ThingDef.Item.BeMade.CostItems:Add(newitem)
end

function JYS:OnBeforeInit()
	AddCostItem("Item_HardWood","Item_huobi", 1);--金丝木
	AddCostItem("Item_LingWood","Item_huobi", 1);--灵木
	AddCostItem("Item_ParasolWood","Item_huobi", 1);--梧桐木
	AddCostItem("Item_IronRock","Item_huobi", 1);--铁矿
	AddCostItem("Item_CopperRock","Item_huobi", 1);--火铜矿石
	AddCostItem("Item_SilverRock","Item_huobi", 1);--寒晶矿石
	AddCostItem("Item_DarksteelRock","Item_huobi", 1);--玄铁
	AddCostItem("Item_StarEssence","Item_huobi", 1);--星髓
	AddCostItem("Item_BrownRock","Item_huobi", 1);--棕石
	AddCostItem("Item_Marble","Item_huobi", 1);--大理石
	AddCostItem("Item_Jade","Item_huobi", 1);--玉石
	AddCostItem("Item_SkyStone","Item_huobi", 1);--天柱石
	AddCostItem("Item_SoulCrystalYou","Item_huobi", 1);--幽珀
	AddCostItem("Item_SoulCrystalLing","Item_huobi", 1);--灵珀
	AddCostItem("Item_SoulCrystalNing","Item_huobi", 1);--宁珀
	AddCostItem("Item_Yao_RabbitLuck","Item_huobi", 1);--兔妖的脚
	AddCostItem("Item_Yao_WolfAtk","Item_huobi", 1);--妖狼的尖牙
	AddCostItem("Item_Yao_SnakeHanLin","Item_huobi", 1);--妖蛇的寒鳞
	AddCostItem("Item_Yao_BearPiMao","Item_huobi", 1);--熊妖的脖颈毛
	AddCostItem("Item_Yao_TurtleKe","Item_huobi", 1);--巨龟的坚甲
	AddCostItem("Item_DragonShit","Item_huobi", 1);--天龙砂
	AddCostItem("Item_DragonScale","Item_huobi", 1);--龙鳞
	AddCostItem("Item_ZaoHuaYuLu","Item_huobi", 1);--造化玉露
	AddCostItem("Item_HuoEssence","Item_huobi", 1);--朱果
	AddCostItem("Item_ShuiEssence","Item_huobi", 1);--五色金莲
	AddCostItem("Item_MuEssence","Item_huobi", 1);--木枯藤
	AddCostItem("Item_JinEssence","Item_huobi", 1);--琅琊果
	AddCostItem("Item_TuEssence","Item_huobi", 1);--赭黄精
	AddCostItem("Item_EarthEssence","Item_huobi", 1);--地母灵液
	AddCostItem("Item_LifeStream","Item_huobi", 1);--长生泉
	AddCostItem("Item_SoulPearl","Item_huobi", 1);--玄牝珠
	AddCostItem("Item_MonsterBlood","Item_huobi", 1);--妖灵血-
	AddCostItem("Item_Cinnabar","Item_huobi", 1);--朱砂
	AddCostItem("Item_LingMuXueJie","Item_huobi", 1);--灵木血竭
	AddCostItem("Item_EarthEssence_1","Item_huobi", 1);--灵髓脂
	AddCostItem("Item_YuanHunLu","Item_huobi", 1);--元魂露
	AddCostItem("Item_YanDaoGuo","Item_huobi", 1);--演道果
	AddCostItem("Item_EarthEssence1","Item_huobi", 1);--邪脉血泉
	AddCostItem("Item_EarthEssence1_1","Item_huobi", 1);--血髓脂
	AddCostItem("Item_XieHunLu","Item_huobi", 1);--邪魂露
	AddCostItem("Item_QieDaoGuo","Item_huobi", 1);--窃道果
	AddCostItem("Item_ThunderAir","Item_huobi", 1);--天劫之息
	AddCostItem("Item_StoneBox2","Item_huobi", 1);--古旧石匣
	AddCostItem("Item_XianBone","Item_huobi", 1);--仙人遗骨
	AddCostItem("Item_ZaoHuaYuZi","Item_huobi", 1);--造化玉籽
	AddCostItem("Item_Mint","Item_huobi", 1);--清心草
	AddCostItem("Item_MagicHerb","Item_huobi", 1);--灵仙草
	AddCostItem("Item_Ginkgo","Item_huobi", 1);--银杏果
	AddCostItem("Item_ExtremeJade","Item_huobi", 1);--千棱神玉
	AddCostItem("Item_Boss_Fenghuangneidan","Item_huobi", 1);--凤凰内丹
	AddCostItem("Item_Boss_Fenghuanghuoyu","Item_huobi", 1);--凤凰火羽
	AddCostItem("Item_BossFeng_HuoYu","Item_huobi", 1);--炽烈的火羽
	AddCostItem("Item_BossFeng_GangYu","Item_huobi", 1);--凶凤的刚羽
	AddCostItem("Item_BossFeng_TouYu","Item_huobi", 1);--凶凤的烬灭羽
	AddCostItem("Item_BossFeng_WeiYu","Item_huobi", 1);--凶凤的蔽天羽
	AddCostItem("Item_BossFeng_Gu","Item_huobi", 1);--凶凤的坚空骨
	AddCostItem("Item_BossFeng_HongYu","Item_huobi", 1);--凶凤的真焱玉
	AddCostItem("Item_BossFeng_Meat","Item_huobi", 1);--凶凤的血肉
	AddCostItem("Item_DragonScale","Item_huobi", 1);--脱落的龙鳞
	AddCostItem("Item_Boss_Jiaowangci","Item_huobi", 1);--蛟王刺
	AddCostItem("Item_BossLong_Jiao","Item_huobi", 1);--蛟龙的天角
	AddCostItem("Item_BossLong_Zhua","Item_huobi", 1);--蛟龙的罗刹爪
	AddCostItem("Item_BossLong_Lin","Item_huobi", 1);--蛟龙的玄鳞
	AddCostItem("Item_BossLong_NiLin","Item_huobi", 1);--蛟龙的逆鳞
	AddCostItem("Item_BossLong_Jing","Item_huobi", 1);--蛟龙的崩天筋
	AddCostItem("Item_BossLong_Meat","Item_huobi", 1);--蛟龙的血肉
	AddCostItem("Item_BossZhuLong_BaiLin","Item_huobi", 1);--洁白的大鳞
	AddCostItem("Item_BossZhuLong_HeiLin","Item_huobi", 1);--漆黑的大鳞
	AddCostItem("Item_BossZhuLong_Eye","Item_huobi", 1);--阴阳之结晶
	AddCostItem("Item_BossZhuLong_TianLin","Item_huobi", 1);--烛龙的天鳞
	AddCostItem("Item_BossZhuLong_LongYu","Item_huobi", 1);--混沌的龙玉
	AddCostItem("Item_BossZhuLong_Meat","Item_huobi", 1);--原初血肉
	AddCostItem("Item_BossFeng_FengYin","Item_huobi", 1);--凤纹古玉
	AddCostItem("Item_BossZhuLong_FengYin","Item_huobi", 1);--黑白色的古玉
	AddCostItem("Item_XianBoneBall","Item_huobi", 1);--神舍利
	AddCostItem("Item_XianDaoXieNian","Item_huobi", 1);--仙识邪念
	AddCostItem("Item_God_ZhiNianJieJing","Item_huobi", 1);--执念结晶
	AddCostItem("Item_BenYuan_Jin","Item_huobi", 1);--金属性本源
	AddCostItem("Item_BenYuan_Mu","Item_huobi", 1);--木属性本源
	AddCostItem("Item_BenYuan_Shui","Item_huobi", 1);--水属性本源
	AddCostItem("Item_BenYuan_Huo","Item_huobi", 1);--火属性本源
	AddCostItem("Item_BenYuan_tu","Item_huobi", 1);--土属性本源
	AddCostItem("Item_BenYuan_None","Item_huobi", 1);--无属性本源
	AddCostItem("Item_Cotton","Item_huobi", 1);--棉花
	AddCostItem("Item_RedGinseng","Item_huobi", 1);--赤参
	AddCostItem("Item_PurpleGanodermaLucidum","Item_huobi", 1);--紫芝	
end