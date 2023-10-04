<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("emailVerifyTitle")}
    <#elseif section = "form">
        <p class="instruction">${msg("emailVerifyInstruction1",user.email)}</p>
    <#elseif section = "info">
        <p class="instruction">
            ${msg("emailVerifyInstruction2")}
            <br/>
            <#-- Custom edit remove space -->
            <a href="${url.loginAction}">${msg("doClickHere")}</a>${kcSanitize(msg("emailVerifyInstruction3"))?no_esc}

            <#--Custom edit support logout-->
            <br/>
            ${msg("ez.or")} <a id="logouthref" style="margin-left: 0">${msg("ez.doSignOut")}</a>.
            <#--Check if we are on dev or prod-->
            <script>document.getElementById('logouthref').href = "/auth/realms/master/protocol/openid-connect/logout?redirect_uri=https%3A%2F%2F" + (window.location.host.startsWith("dev.") ? "dev." : "") + "lahendus.ut.ee";</script>
            <#--Custom edit support logout-->
        </p>
    </#if>
</@layout.registrationLayout>
