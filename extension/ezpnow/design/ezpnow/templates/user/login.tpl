<div class="box">
<div class="tl"><div class="tr"><div class="br"><div class="bl"><div class="box-content float-break">

<div class="user-login">

<form method="post" action={"/user/login/"|ezurl} name="loginform">

<div class="attribute-header">
	<h1 class="long">{"Login"|i18n("design/standard/user")}</h1>
</div>

{if $User:warning.bad_login}
<div class="warning">
<h2>{"Could not login"|i18n("design/standard/user")}</h2>
<ul>
    <li>{"A valid username and password is required to login."|i18n("design/standard/user")}</li>
</ul>
</div>
{else}

{if $site_access.allowed|not}
<div class="warning">
<h2>{"Access not allowed"|i18n("design/standard/user")}</h2>
<ul>
    <li>{"You are not allowed to access %1."|i18n("design/standard/user",,array($site_access.name))}</li>
</ul>
</div>
{/if}

{/if}

<div class="block">
<label for="id1">{"Username"|i18n("design/standard/user",'User name')}</label><div class="labelbreak"></div>
<input class="halfbox" type="text" size="10" name="Login" id="id1" value="{$User:login|wash}" tabindex="1" />
</div>
<div class="block">
<label for="id2">{"Password"|i18n("design/standard/user")}</label><div class="labelbreak"></div>
<input class="halfbox" type="password" size="10" name="Password" id="id2" value="" tabindex="1" />
</div>
<div class="block">
<label for="id3">{"Log in to the administration interface"|i18n("design/standard/user")}</label><div class="labelbreak"></div>
<input type="checkbox" size="10" name="AdminSiteaccessURI" id="id3" value="" tabindex="1" onclick="AdminSiteaccessCheckbox(this);" />
</div>

<div class="buttonblock">
<input class="defaultbutton" type="submit" name="LoginButton" value="{'Login'|i18n('design/standard/user','Button')}" tabindex="1" />
<input class="button" type="submit" name="RegisterButton" id="RegisterButton" value="{'Sign Up'|i18n('design/standard/user','Button')}" tabindex="1" />
</div>

{if ezini( 'SiteSettings', 'LoginPage' )|eq( 'custom' )}
    <p><a href={'/user/forgotpassword'|ezurl}>{'Forgot your password?'|i18n( 'design/standard/user' )}</a></p>
{/if}

<input type="hidden" name="RedirectURI" value="{$User:redirect_uri|wash}" />

{if and( is_set( $User:post_data ), is_array( $User:post_data ) )}
  {foreach $User:post_data as $key => $post_data}
     <input name="Last_{$key}" value="{$postData}" type="hidden" /><br/>
  {/foreach}
{/if}

</form>
{*
	Set siteaccess name for AdminSiteAccessName variable
	site.ini.[SiteAccessSettings].AdminSiteAccessName
*}
<script type="text/javascript">
<!--

var loginForm = document.loginform;
var loginFormDefaultAction = loginForm.action;

function AdminSiteaccessCheckbox( val )
{ldelim}

	if( val.checked )
		loginForm.action = '/{ezini( 'SiteAccessSettings', 'AdminSiteAccessName' )}/user/login';
	else 
		loginForm.action = loginFormDefaultAction;

{rdelim} 

-->
</script>

</div>

</div></div></div></div></div>
</div>