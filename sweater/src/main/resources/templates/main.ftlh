<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
<div>
    <@l.logout "/logout" />
    <span><a href="/user">User list</a></span>
</div>
<div>
    <form method="post">
        <input type="text" name="text" placeholder="Введите сообщение" />
        <input type="text" name="tag" placeholder="Тэг">
        <button type="submit">Добавить</button>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
    </form>
</div>
<h2>Список сообщений</h2>
<form method="get" action="/main">
    <input type="tag" name="tag" value="${(tag)!}"">
    <button type="submit">Найти</button>
</form>
<#list messages as message>
    <div>
        <b>${message.id}</b>
        <span>${message.text}</span>
        <i>${message.tag}</i>
        <strong>${(message.authorName)!}</strong>
    </div>
<#else>
No messages
</#list>
</@c.page>
