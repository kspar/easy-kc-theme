<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("emailVerifyTitle")}
    <#elseif section = "form">
        <p class="instruction">${msg("emailVerifyInstruction1")}</p>
    <#elseif section = "info">
        <p class="instruction">
            ${msg("emailVerifyInstruction2")}
            <br/>
            <a href="${url.loginAction}">${msg("doClickHere")}</a> ${msg("emailVerifyInstruction3")}
        </p>
    <#--Custom edit support logout-->
        <p class="instruction">${msg("or")} <a id="logouthref">${msg("doSignOut")}</a>.</p>
    <#--Check if we are on dev or prod-->
        <script>document.getElementById('logouthref').href = "/auth/realms/master/protocol/openid-connect/logout?redirect_uri=https%3A%2F%2F" + (window.location.host.includes(".idp") ? "dev." : "") + "lahendus.ut.ee%2Fcourses";</script>
    <#--Custom edit support logout-->
    </#if>
</@layout.registrationLayout>