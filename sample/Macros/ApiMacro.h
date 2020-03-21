//
//  ApiMacro.h
//  BlueHouse
//
//  Created by ikey on 2019/10/31.
//  Copyright © 2019 QuanSu. All rights reserved.
//

#ifndef ApiMacro_h
#define ApiMacro_h
#define BaseUrl @"https://api.landsoul-lifestyle.com/api.php/"
//#define BaseUrl @"https://apidev.landsoul-lifestyle.com/api.php/"
//#define BaseUrl @"http://192.168.50.148/api.php/"
#define GameURL @"https://webapp.landsoul-lifestyle.com/landsoul/jumper/index.html"
/*规则/政策对应ID
58 里程券规则
57 邀请奖励规则
54 旅游线路券使用规则
53 营业执照
52 关于蓝宿
51 抽奖规则
50 活动报名规则
49《蓝宿用户注册协议》
48《蓝宿隐私政策》
47《蓝宿免责声明》
46《蓝宿用户使用协议》
45 分销规则
44 积分规则
 */
#define ShareUrl(TravelID) [NSString stringWithFormat:@"https://webapp.landsoul-lifestyle.com/landsoul/share.html?id=%@",TravelID]
#define HTTPRuleURL(RuleID) [NSString stringWithFormat:@"https://webapp.landsoul-lifestyle.com/landsoul/Set.html?id=%@",RuleID]
#define AppStoreUrl @"https://apps.apple.com/us/app/%E8%93%9D%E5%AE%BF%E5%85%A8%E7%90%83-%E5%8D%81%E5%9B%BD%E6%B7%B1%E5%BA%A6%E6%B8%B8%E7%8E%A9/id1487400397?l=zh&ls=1"

#define SEVER_APPEND(apiUrl) [NSString stringWithFormat:@"%@%@",BaseUrl,apiUrl]
#pragma mark -版本
#define Http_version_api SEVER_APPEND(@"version/index")
#pragma mark -登录接口
#define Http_login_api SEVER_APPEND(@"common/login")
#define Http_wxlogin_api SEVER_APPEND(@"common/wxLogin")
#define Http_qqlogin_api SEVER_APPEND(@"common/qqLogin")
#define Http_getCode_api SEVER_APPEND(@"common/sendsms")
#define Http_register_api SEVER_APPEND(@"common/register")
#define Http_login_phoneCode SEVER_APPEND(@"common/mobilelogin")
#define Http_getCode_forgetPassword SEVER_APPEND(@"common/getpwdsms")
#define Http_setPassword_forgetPassword SEVER_APPEND(@"common/setpwdsms")
#pragma mark - 活动接口
#define Http_activityList_api SEVER_APPEND(@"activity/activitylist")
#define Http_activitySignUp_api SEVER_APPEND(@"order/addOrder")
#define Http_activity_collect SEVER_APPEND(@"collect/collectList")
#define Http_activity_detail SEVER_APPEND(@"activity/getActivityInfo")

#pragma mark -个人中心

#define Http_userInfo_api SEVER_APPEND(@"user/getinfo")
#define Http_userInfo_edit SEVER_APPEND(@"user/setinfo")
#define Http_userInfo_bindwx SEVER_APPEND(@"common/bindwx")
#define Http_userInfo_bindmobile SEVER_APPEND(@"common/bindmobile")
#define Http_userInfo_changepassword SEVER_APPEND(@"common/changepassword")

#define Http_freed_freedList SEVER_APPEND(@"freed/freedList") 

#pragma mark -上传
#define Http_upload SEVER_APPEND(@"upload/oss")

#pragma mark -卡券中心
#define Http_CardList_api SEVER_APPEND(@"ticket/getList")
#define Http_DrawCard_api SEVER_APPEND(@"ticket/setvalue")//领取奖励券order/cardOrder
#define Http_SearchUser_api SEVER_APPEND(@"user/seachuser")//搜索用户
#define Http_GiveCardTo_api SEVER_APPEND(@"ticket/setuserid")
#define Http_CardOrder_OrderList SEVER_APPEND(@"order/cardOrder")
#define Http_Card_CardCount SEVER_APPEND(@"ticket/getcount")
//
#pragma mark -活动订单
#define Http_order_orderList SEVER_APPEND(@"order/orderList")
#define Http_order_addRechargeOrder SEVER_APPEND(@"order/addRechargeOrder")
#define Http_order_orderInfo SEVER_APPEND(@"order/getOrderById")
#define Http_order_cancel SEVER_APPEND(@"order/cancelOrder")
#pragma mark - 支付
#define Http_pay_wxPrePay SEVER_APPEND(@"pay/wxPrePay")
#define Http_pay_aliPrePay SEVER_APPEND(@"pay/aliPrePay")

#pragma mark -我的消息message/readMsg
#define Http_message_messageList SEVER_APPEND(@"message/msgList")
#define Http_message_messageIsRead SEVER_APPEND(@"message/readMsg")
#define Http_message_unReadNum SEVER_APPEND(@"message/getreadnum")
#pragma mark -积分中心
#define Http_point_pointList SEVER_APPEND(@"points/getlist")
#pragma mark -收藏列表 (取消也可以用)
#define Http_collect_collectList SEVER_APPEND(@"collect/collectList")
#pragma mark -我的邀请
#define Http_Invite_MyInfo SEVER_APPEND(@"user/inviteinfo")
#define Http_Invite_List1 SEVER_APPEND(@"user/invitelist")
#define Http_Invite_List SEVER_APPEND(@"user/getteamlist")
#pragma mark -游记模块
#define Http_Notes_NotesList SEVER_APPEND(@"twitter/lists")
#define Http_Notes_NotesPost SEVER_APPEND(@"twitter/add")
#define Http_Notes_NotesDel SEVER_APPEND(@"twitter/del")
#define Http_Notes_Praise SEVER_APPEND(@"twitter/ilike")
#define Http_Notes_Collect SEVER_APPEND(@"twitter/icollect")
#define Http_Notes_Comment SEVER_APPEND(@"twitter/icomment")
#define Http_Notes_Share SEVER_APPEND(@"twitter/share")
#define Http_Notes_Report SEVER_APPEND(@"twitter/report")
#define Http_Notes_Attention SEVER_APPEND(@"twitter/friend")
#define Http_Notes_Info SEVER_APPEND(@"twitter/info")
#define Http_Notes_CommentList SEVER_APPEND(@"twitter/commentlist")
#define Http_Notes_Friend SEVER_APPEND(@"twitter/friendlist")
#define Http_Notes_NotesUserInfo SEVER_APPEND(@"twitter/userinfo")
#define Http_Notes_cycleNoti SEVER_APPEND(@"twitter/getpointslogmsg")

#define Http_Notes_VideoList SEVER_APPEND(@"twitter/video")
#define Http_Notes_VideoSet SEVER_APPEND(@"twitter/videoset")//likes reads zhuanfa_num
#pragma mark -活动
#define Http_Activity_Banner SEVER_APPEND(@"banner/index")
#define Http_Activity_List SEVER_APPEND(@"activity/lists")
#define Http_ZoChou_List SEVER_APPEND(@"zochou/lists") 
#endif /* ApiMacro_h */
