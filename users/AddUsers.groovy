def service = com.liferay.portal.kernel.bean.PortalBeanLocatorUtil.locate("com.liferay.portal.service.UserLocalService");

def adminUserId = 10198L
def companyId = 10156L
def groupIds = new long[1] 
groupIds[0] = 10504
def roleIds = new long[0]
def organizationIds = new long[0]
def userGroupIds = new long[0]
def serviceContext = new com.liferay.portal.service.ServiceContext()
def locale = com.liferay.portal.kernel.util.LocaleUtil.getDefault()
long facebookId = 0
def password = ""

(1..100).each {
def email = "ejemplo$it@liferay.com";
def first = "ejemplo$it"

service.addUser(adminUserId, companyId, true, password, password, true, "", email, facebookId, "", locale, first,first,first, 0, 0, true, 1,1,1999, "", groupIds, organizationIds, roleIds, userGroupIds, false, serviceContext)
}

