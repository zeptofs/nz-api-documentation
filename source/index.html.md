---
title: Split API v1.0
language_tabs:
  - shell: Shell
  - http: HTTP
  - javascript: JavaScript
  - javascript--nodejs: Node.JS
  - ruby: Ruby
  - python: Python
  - java: Java
toc_footers: []
includes: []
search: true
highlight_theme: darkula
headingLevel: 2


---


<h1 id="Split-API">Split API v1.0</h1>


> Scroll down for code samples, example requests and responses. Select a language for code samples from the tabs above or the mobile navigation menu.


Split allows you to make, get and manage payments using nothing but bank accounts.


It is important to understand that there are 2 main ways Split can be used for maximum flexibility:


1. Between Split accounts.
2. Between a Split account and anyone.


Due to the above, certain endpoints and techniques will differ slightly depending on who you are interacting with. You can find more on this in the [Making payments](/#making-payments) and [Getting paid](/#getting-paid) guides.


<div class="middle-header">Conventions</div>


* Authentication is performed using OAuth2. See the [Get started](/#get-started) and [Authentication & Authorisation](/#authentication-and-authorisation) guides for more.
* All communication is via `https`.
* Production API: `https://api.split.cash/`.
* Production UI: `https://go.split.cash/`.
* Sandbox API: `https://api-sandbox.split.cash/`.
* Sandbox UI: `https://go-sandbox.split.cash/`.
* Data is sent and received as JSON.
* Currencies are represented by 3 characters as defined in [ISO 4217](http://www.xe.com/iso4217.php).
* Dates & times are returned in UTC using [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format with second accuracy. With requests, when no TZ is supplied, the configured TZ of the authenticated user is used.
* Amounts are always in cents with no decimals unless otherwise stated.


# Guides


## Try it out
The best way to familiarise yourself with our API is by interacting with it.


**Prefer a screencast? We've got you covered: [https://vimeo.com/246203244](https://vimeo.com/246203244).**


We've preloaded a collection of all our endpoints for you to use in Postman.


Before you start, load up our API collection:


[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/988421dc8fb7d55526d5#?env%5BSplit%20Payments%20Public%20Sandbox%5D=W3siZW5hYmxlZCI6dHJ1ZSwia2V5Ijoic2l0ZV9ob3N0IiwidmFsdWUiOiJodHRwczovL2dvLXNhbmRib3guc3BsaXQuY2FzaCIsInR5cGUiOiJ0ZXh0In0seyJlbmFibGVkIjp0cnVlLCJrZXkiOiJhcGlfaG9zdCIsInZhbHVlIjoiaHR0cHM6Ly9hcGktc2FuZGJveC5zcGxpdC5jYXNoIiwidHlwZSI6InRleHQifSx7ImVuYWJsZWQiOnRydWUsImtleSI6Im9hdXRoMl9hcHBsaWNhdGlvbl9pZCIsInZhbHVlIjoiIiwidHlwZSI6InRleHQifSx7ImVuYWJsZWQiOnRydWUsImtleSI6Im9hdXRoMl9zZWNyZXQiLCJ2YWx1ZSI6IiIsInR5cGUiOiJ0ZXh0In0seyJlbmFibGVkIjp0cnVlLCJrZXkiOiJhdXRob3Jpc2F0aW9uX2NvZGUiLCJ2YWx1ZSI6IiIsInR5cGUiOiJ0ZXh0In0seyJlbmFibGVkIjp0cnVlLCJrZXkiOiJhY2Nlc3NfdG9rZW4iLCJ2YWx1ZSI6IiIsInR5cGUiOiJ0ZXh0In0seyJlbmFibGVkIjp0cnVlLCJrZXkiOiJyZWZyZXNoX3Rva2VuIiwidmFsdWUiOiIiLCJ0eXBlIjoidGV4dCJ9XQ==)


Okay, lets get things setup!


1. **Create a Split account**


    If you haven't already, you'll want to create a sandbox Split account at [https://go-sandbox.split.cash](https://go-sandbox.split.cash)


2. **Register your application with Split**


    Sign in and create an OAuth2 application: [https://go-sandbox.split.cash/oauth/applications](https://go-sandbox.split.cash/oauth/applications).


    [![Split OAuth2 app setup](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/split_oauth2_app_setup.png)](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/split_oauth2_app_setup.png)


3. **In Postman, setup your environment variables**


    Click on **Manage Environments**


    [![Postman environment variables](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/postman_environment_gear.png)](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/postman_environment_gear.png)


    We've included the **Split Payments Public Sandbox** environment to get you started. Go ahead an click on it.


    [![Select Postman environment](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/postman_select_environment.png)](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/postman_select_environment.png)


    Using the details from the OAuth2 app you created earlier, fill in the **oauth2_application_id** & **oauth2_secret** fields.


    [![Fill in environment values](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/postman_environment_values.png)](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/postman_environment_values.png)


4. **Setup the authorization**


    Click on the **Authorization** tab and select **OAuth 2.0**


    [![Postman Authorization tab](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/postman_authorization_tab.png)](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/postman_authorization_tab.png)


    Click the **Get New Access Token** button


    [![Postman get new access token](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/postman_get_new_access_token.png)](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/postman_get_new_access_token.png)


    Fill in the OAuth2 form as below:


    [![Postman OAuth2](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/postman_oauth2_form.png)](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/postman_oauth2_form.png)


5. **Get authorised**


    Click **Request Token** and wait a few seconds and a browser window will popup


    Sign in with your Split account (or any other Split account you want to authorise).


    [![Signin Split to authorise via OAuth2](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/split_oauth2_signin.png)](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/split_oauth2_signin.png)


    Click **Authorise** to allow the app to access the signed in account. Once complete, Postman will automatically exchange the authorisation code it received from Split for the `access_token/refresh_token` pair. It will then store the `access_token/refresh_token` for you to use in subsequent API requests. The `access_token` effectively allows you to send requests via the API as the user who provided you authorisation.


    [![Authorise OAuth2 app](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/oauth2_app_authorise.png)](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/oauth2_app_authorise.png)


6. **You're now ready to use the API**


    Select an endpoint from the Split collection from the left hand side menu. Before you send an API request ensure you select your access token and Postman will automatically add it to the request header.


    [![Postman use token](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/postman_use_token.png)](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/postman_use_token.png)


<aside class="notice">Remember to select the access token everytime you try a new endpoint. Have fun!</aside>


## Get started
This guide will help you setup your OAuth2 app in order to get authenticated & authorised to communicate with the Split API.


**Before you start:**


* Often times you'll want to grant your own app access to itself so that you can access the API on your own account. We use the term **user** below but the user can be a third party or the same user that owns the OAuth2 application.
* As noted below, the access token expires every 2 hours. To get a new access token without going through steps 1 to 4 again, use the [refresh grant strategy](/#authentication-and-authorisation) to swap a refresh token for a new access token.


1. **Create a Split account**


    If you haven't already, you'll want to create a sandbox Split account at [https://go-sandbox.split.cash](https://go-sandbox.split.cash).


2. **Register your application with Split**


    Once you've got your account up and running, sign in and create an OAuth2 profile for your application: [https://go-sandbox.split.cash/oauth/applications](https://go-sandbox.split.cash/oauth/applications)


    | Parameter | Description |
    |-----------|-------------|
    | **Name**  | The name of your application. When using the the *Authorisation Grant Flow*, users will see this name as the application requesting access to their account. |
    | **Redirect URI** | Set this to your application's endpoint charged with receiving the authorisation code. |


3. **Obtain an authorisation code**


    Construct the initial URL the user will need to visit in order to grant your application permission to act on his/her behalf. The constructed URL describes the level of permission ([`scope`](/#scopes)), the application requesting permission (`client_id`) and where the user gets redirected once they've granted permission (`redirect_uri`).


    The URL should be formatted to look like this:
    `https://go-sandbox.split.cash/oauth/authorize?response_type=code&client_id={client_id}&redirect_uri={redirect_uri}&scope={scope}`


    | Parameter | Description |
    |-----------|-------------|
    | `response_type` | Always set to `code` |
    | `client_id` | This is your `Application ID` as generated when you registered your application with Split |
    | `redirect_uri` | URL where the user will get redirected along with the newly generated authorisation code |
    | `scope` | The [scope](/#scopes) of permission you're requesting |


4. **Exchange the authorisation code for an access token**


    When the user visits the above-mentioned URL, they will be presented with a Split login screen and then an authorisation screen:


    [![Authorise OAuth2 app](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/oauth2_app_authorise.png)](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/oauth2_app_authorise.png)


    After the user has authorised your application, they will be returned to your application at the URL specified in `redirect_uri` along with the `code` query parameter as the authorisation code.


    Finally, the authorisation code can than be exchanged for an access token and refresh token pair by POSTing to: `https://go-sandbox.split.cash/oauth/token`


    | Parameter | Description |
    |-----------|-------------|
    | `grant_type` | Set to `authorization_code` |
    | `client_id` | This is your `Application ID` as generated when you registered your application with Split |
    | `client_secret` | This is your `Secret` as generated when you registered your application with Split |
    | `code` | The authorisation code returned with the user |
    | `redirect_uri` | Same URL used in step 3 |


5. **Wrap-up**


    Now that you have an access token and refresh token, you can interact with the Split API as the user related to the access token.
    To do so, you must simply append the access token to the header of any API request: `Authorization: Bearer {access_token}`


## Authentication and Authorisation


Split uses OAuth2 over https to manage authentication and authorisation.


OAuth2 is a protocol that lets external applications request permission from another Split user to send requests on their behalf without getting their password.
This is preferred over Basic Authentication because access tokens can be limited by scope and can be revoked by the user at any time.


New to OAuth2? DigitalOcean has a fantastic 5 minute [introduction to OAuth2](https://www.digitalocean.com/community/tutorials/an-introduction-to-oauth-2#grant-type-authorization-code).


We currently support the **authorisation code** and **refresh token** grants.


### Authorisation Code Grant
This type of grant allows your application to act on behalf of a user. If you've ever used a website or application with your
Google, Twitter or Facebook account, this is the grant being used.


See the [Get Started guide](/#get-started) for step by step details on how to use this grant.


### Refresh Token Grant


> Code sample


```
curl -F "grant_type=refresh_token" \
     -F "client_id={{oauth2_application_id}}" \
     -F "client_secret={{oauth2_application_secret }}" \
     -F "refresh_token={{refresh_token}}" \
     -X POST https://go-sandbox.split.cash/oauth/token
```


> Example response


```json
{
    "access_token": "ad0b5847cb7d254f1e2ff1910275fe9dcb95345c9d54502d156fe35a37b93e80",
    "token_type": "bearer",
    "expires_in": 7200,
    "refresh_token": "cc38f78a5b8abe8ee81cdf25b1ca74c3fa10c3da2309de5ac37fde00cbcf2815",
    "scope": "public"
}
```


When using the authorisation code grant above, Split will return a `refresh token` along with the access token. Access tokens are short lived and last 2 hours but refresh tokens do not expire.


When the access token expires, instead of sending the user back through the authorisation flow you can use the refresh token to retrieve a new access token with the same permissions as the old one.


<aside class="notice">
  The <code>refresh_token</code> gets regenerated and sent alongside the new <code>access_token</code>. In other words, <code>refresh_token</code>s are single use so you'll
want to store the newly generated <code>refresh_token</code> everytime you use it to get a new <code>acccess_token</code>
</aside>


## Making payments
In order to payout funds, you'll be looking to use the [Payments](/#Split-API-Payments) endpoint. Whether you're paying out another Split account holder or anyone, the process is the same:


1. Add the recipient to your Contacts: [Split Contact](/#add-a-split-contact) or [Anyone Contact](/#add-an-anyone-contact)
2. [Make the Payment](/#make-a-payment) to your Contact.


Common use cases:


* Automated payout disbursement (Referal programs, net/commission payouts, etc...)


## Getting paid
There are 2 ways to get paid:


### POSTing a [Payment Request](/#Split-API-Payment-Requests)


Provides the ability to send a Payment Request (get paid) to any Contact that is either:


* A Split Contact (A bank account owner that has a Split account); **or**
* An Anyone Contact (A bank account owner that is not registered with Split) with an accepted Agreement in place.


**For a Split Contact**:


* They will receive a request that they must approve via the Split UI or API in order for the funds to flow from their bank account to yours.


* To automate the Payment Request approval, process you must first [enter into an Agreement](/#Split-API-Agreements) with the Split Contact. Once the Agreement is accepted, any future Payment Request will be automatically approved and processed per the Agreement terms.


**For an Anyone Contact**:


* To send a Payment Request using the API to an Anyone Contact, you must first have an accepted Agreement with them . To do so, you can send them an [Open Agreement link](https://help.split.cash/agreements/open-agreement) or [Unassigned Agreement link](http://help.split.cash/agreements/unassigned-agreement) for them to [elect & verify their bank account](https://help.split.cash/bank-accounts/instant-account-verification-iav) and accept the Agreement.


Common use cases:


* Subscriptions
* On-account balance payments
* Bill smoothing
* Repayment plans


Example flow embedding an [Open Agreement link](https://help.split.cash/agreements/open-agreement) using an iFrame in order to automate future Payment Request approvals:


[![Hosted Open Agreement](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/host_oa.png)](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/host_oa.png)


### Sharing an [Open Payment Request](http://help.split.cash/payment-requests/open-payment-requests)


Provides the ability to get paid once-off by a anyone whether they are a Split account holder or not.


Usage notes:


* Utilise a [customisable hosted Payment Request form](http://help.split.cash/payment-requests/open-payment-requests) that takes care of everything from confirming the payer's bank account access to the transfer of funds.
* The Open Payment Request link can be shared and sit as a secure form either outside your app or embeded within via iframe with the ability to whitelabel.
* The URL for the form contains all the customisation parameters enabling you to generate the form on the fly.


Common use cases:


* Online or offline purchases (eCommerce, fundraiser, etc...)
* Invoice payment
* Group funding (paying for a restaurant bill)


Example flow embedding the [Open Payment Request](https://help.split.cash/payment-requests/open-payment-requests) link using an iFrame:


[![Hosted Open Payment Request](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/hosted_opr.png)](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/hosted_opr.png)


## Idempotent requests


> Example response


```json
{
  "errors": [
    {
      "title": "Duplicate idempotency key",
      "detail": "A resource has already been created with this idempotency key",
      "links": {
        "about": "https://docs.split.cash/"
      },
      "meta": {
        "resource_ref": "PB.1a4"
      }
    }
  ]
}
```


The Split API supports idempotency for safely retrying requests without accidentally performing the same operation twice.
For example, if a [Payment](#Split-API-Payments) is `POST`ed and a there is a network connection error, you can retry the Payment with the same idempotency key to guarantee that only a single Payment is created.


To perform an idempotent request, provide an additional `Idempotency-Key: <key>` header to the request.
You can pass any value as the key but we suggest that you use [V4 UUIDs](https://www.uuidgenerator.net/) or another appropriately random string.


Keys expire after 24 hours. If there is a subsequent request with the same idempotency key within the 24 hour period, we will return a `409 Conflict`.


* The `meta.resource_ref` value is the reference of the resource that was previously created with the conflicting idempotency key.
* The `Idempotency-Key` header is optional but recommended.
* Only the `POST` action for the Payments, Payment Requests, Refunds, Refund Requests support the use of the `Idempotency-Key`.
* Endpoints that use the `GET` or `DELETE` actions are idempotent by nature.


## Speeding up onboarding
Consider the following scenario:


<blockquote class="main-quote">Split is integrated in your application to handle payments.<br>A customer would like to use Split but does not yet have Split account.<br>You already have some information about this customer.</blockquote>


Given the above, in a standard implementation where a customer enables/uses Split within your application, these are the steps they would follow:


1. Click on some sort of button within your app to use Split.
2. They get redirected to the Split sign in page (possibly via a popup or modal).
3. Since they don't yet have a Split account, they would click on sign up.
4. They would fill in all their signup details and submit.
5. They would be presented with the [authorisation page](https://raw.githubusercontent.com/splitpayments/public_assets/master/images/oauth2_app_authorise.png).
6. They would click the "Authorise" button and be redirected to your app.


Whilst not too bad, we can do better!


In order to speed up the process, we allow query string params to be appended to the [authorisation URL](/#get-started). For instance, if we already have some information about the customer and know they probably don't have a Split account, we can embed this information in the authorisation URL.


**Supported query string parameters**


| Parameter | Description |
|-----------|--------|
| `landing`   | Accepted values: `business_sign_up` or `personal_sign_up`. What page the user should see first if not already signed in. Default is the sign in page. |
| `nickname` | Only letters, numbers, dashes and underscores are permitted. This will be used to identify the account in Split. |
| `name` | Business account only. Business name. |
| `abn` | Business account only. Business ABN. |
| `phone` | Business account only. Business phone number. |
| `street_address` | |
| `suburb` | |
| `state` | See the sign up page for accepted values |
| `postcode` | |
| `first_name` | |
| `last_name` | |
| `mobile_phone` | |
| `email` | |


All values should be [URL encoded](https://en.wikipedia.org/wiki/Query_string#URL_encoding).


As an example, the following authorisation URL would display the **personal sign up** & prefill the first name field with **George**:
`https://go-sandbox.split.cash/oauth/authorize?response_type=code&client_id=xxx&redirect_uri=xxx&scope=xxx&landing=personal_sign_up&first_name=George`


You can also pass the values directly to the sign up page outside of the OAuth2 authorisation process. Click on the following link to see the values preloaded: [https://go-sandbox.split.cash/business/sign_up?name=GeorgeCo&nickname=georgeco&first_name=George](https://go-sandbox.split.cash/business/sign_up?name=GeorgeCo&nickname=georgceco&first_name=George).


## Testing details
When using any of our hosted solutions ([Payment Requests](https://help.split.cash/payment-requests/open-payment-requests), [Open Agreements](https://help.split.cash/agreements/open-agreement) or [Unassigned Agreements](http://help.split.cash/agreements/unassigned-agreement)) you may want to test the [Instant Account Verification (IAV)](http://help.split.cash/bank-accounts/instant-account-verification-iav) process where we accept online banking credentials to validate bank account access. To do so, you can use the following credentials:


| Login | Password |
|-------|----------|
| `gavinBelson` | `hooli2016` |
| `jared` | `django` |
| `richard` | `tabsnotspaces` |


<aside class="notice">The credentials will work with any of the available financial institutions.</aside>


# Configuration


## Scopes
Scopes define the level of access granted via the OAuth2 authorisation process. As a best practice, only use the scopes your application will require.


| Scope | Description |
|--------|------------|
| `public` | View user's public information |
| `agreements` | Manage user's Agreements |
| `bank_accounts` | Manage user's Bank Accounts |
| `contacts` | Manage user's Contacts |
| `open_agreements` | Manage user's Open Agreements |
| `payments` | Manage user's Payments |
| `payment_requests` | Manage user's Payment Requests |
| `refund_requests` | Manage user's Refund Requests |
| `refunds` | Manage user's Refunds |
| `transactions` | Access user's Transactions |


## Pagination


> Example response header


```
Link: <http://api-sandbox.split.cash/contacts?page=5>; rel="last", <http://api-sandbox.split.cash/contacts?page=2>; rel="next"
Per-Page: 25
Total: 5
```


All collections are paginated to 25 items by default and the pagination information may be found in the response header. You can customise the pagination by appending `?per_page=x` and/or `?page=x` to the endpoint URL.


## Remitter


> Example request


```json
{
  "...": "...",
  "metadata": {
   "remitter": "CustomRem"
   }
}
```


You can elect to assign a remitter name on a per-request basis when submitting Payments & Payment Requests. Simply append the `remitter` key and a value within the `metadata` key.


* **For Payments**, the party being credited will see the designated remitter name along the entry on their bank statement.
* **For Payment Requests**, the party being debited will see the designated remitter name along the entry on their bank statement.


<aside class="notice">The remitter name MUST be between 3 and 16 characters.</aside>


## Webhooks


> Example response


```json
{
  "event": {
    "type": "object.action",
    "at": "yyyy-mm-ddThh:mm:ssZ",
    "who": {
      "account_id": "x",
      "bank_account_id": "x"
    }
  },
  "data": [
    {
      // The data section will follow the same type of structure
      // as the event type it is representing. For example, if the
      // event type was "debit.scheduled", the data representation
      // structure would be that of a debit object. Too see what a
      // debit object structure looks like, see the Transactions
      // section.
    }
  ]
}
```


We support two main categories of webhooks:


1. **Owner**: These webhooks are managed by the owner of the Split account and only report on events owned by the Split account.
2. **App**: These webhooks are managed by the Split OAuth2 application owner and will report on events relating to any authorised Split account (limited by scope).


All events posted to the designated URL fit the same structure.


<aside class="notice">The sandbox environment allow both HTTP and HTTPS webhook URLs. The live environment however will only POST to HTTPS URLs.
</aside>


<h1 id="Split-API-Agreements">Agreements</h1>


Split Agreements are managed on a per Contact basis and allow two parties to agree on terms for which future Payment Requests will be auto-approved.


Agreement are unidirectional. In other words, if both parties wish for auto-approved Payment Requests, they must each propose an Agreement to the other.


<div class="middle-header">Direction</div>


Agreements are therefore broken up by direction:


1. **Incoming:** Agreement received from another Split account
2. **Outgoing:** Agreement sent to another Split account


##Lifecycle


An Agreement can have the following statuses:


| Status | Description |
|-------|-------------|
| `proposed` | Waiting for the Agreement to be accepted or declined. |
| `accepted` | The Agreement have been accepted and is active. |
| `cancelled` | The Agreement has been cancelled (The initiator or authoriser can cancel an Agreement). |
| `declined` | The Agreement has been declined. |


## Propose an Agreement


<a id="opIdProposeAgreement"></a>


> Code samples


```shell
curl -X POST https://api-sandbox.split.cash/agreements \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}' \
  -d '{
  "authoriser_id": "8df89c16-330f-462b-8891-808d7bdceb7f",
  "terms": {
    "per_payout": {
      "min_amount": null,
      "max_amount": 10000
    },
    "per_frequency": {
      "days": 7,
      "max_amount": 1000000
    }
  }
}'


```


```http
POST https://api-sandbox.split.cash/agreements HTTP/1.1
Host: api-sandbox.split.cash
Content-Type: application/json
Accept: application/json


```


```javascript
var headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


var body = '{
  "authoriser_id": "8df89c16-330f-462b-8891-808d7bdceb7f",
  "terms": {
    "per_payout": {
      "min_amount": null,
      "max_amount": 10000
    },
    "per_frequency": {
      "days": 7,
      "max_amount": 1000000
    }
  }
}';


$.ajax({
  url: 'https://api-sandbox.split.cash/agreements',
  method: 'post',
  data: body,
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');
const inputBody = '{
  "authoriser_id": "8df89c16-330f-462b-8891-808d7bdceb7f",
  "terms": {
    "per_payout": {
      "min_amount": null,
      "max_amount": 10000
    },
    "per_frequency": {
      "days": 7,
      "max_amount": 1000000
    }
  }
}';
const headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/agreements',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


params = '{
  "authoriser_id": "8df89c16-330f-462b-8891-808d7bdceb7f",
  "terms": {
    "per_payout": {
      "min_amount": null,
      "max_amount": 10000
    },
    "per_frequency": {
      "days": 7,
      "max_amount": 1000000
    }
  }
}'


result = RestClient.post 'https://api-sandbox.split.cash/agreements', params, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.post('https://api-sandbox.split.cash/agreements', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/agreements");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`POST /agreements`


Propose an Agreement to another Split Contact


<aside class="notice">You can set any of the term metrics to <code>null</code> if you wish them to not have a limit.</aside>


> Body parameter


```json
{
  "authoriser_id": "8df89c16-330f-462b-8891-808d7bdceb7f",
  "terms": {
    "per_payout": {
      "min_amount": null,
      "max_amount": 10000
    },
    "per_frequency": {
      "days": 7,
      "max_amount": 1000000
    }
  }
}
```


<h3 id="Propose-an-Agreement-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[ProposeAgreementRequest](#schemaproposeagreementrequest)|true|No description|
|» authoriser_id|body|string|true|The Contact's account ID (`Contact.data.account.id`)|
|» terms|body|[Terms](#schematerms)|true|Terms|
|»» per_payout|body|[PerPayout](#schemaperpayout)|true|No description|
|»»» min_amount|body|number|false|Minimum amount in cents a PR can be in order to be auto-approved|
|»»» max_amount|body|number|false|Maximum amount in cents a PR can be in order to be auto-approved|
|»» per_frequency|body|[PerFrequency](#schemaperfrequency)|true|No description|
|»»» days|body|number|false|Amount of days to apply against the frequency|
|»»» max_amount|body|number|false|Maximum amount in cents the total of all PRs can be for the duration of the frequency|


> Example responses


```json
{
  "data": {
    "ref": "A.2",
    "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
    "authoriser_id": "8df89c16-330f-462b-8891-808d7bdceb7f",
    "status": "proposed",
    "responded_at": null,
    "created_at": "2017-03-20T00:53:27Z",
    "terms": {
      "per_payout": {
        "max_amount": 10000,
        "min_amount": null
      },
      "per_frequency": {
        "days": 7,
        "max_amount": 1000000
      }
    }
  }
}
```


<h3 id="Propose an Agreement-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Created|[ProposeAgreementResponse](#schemaproposeagreementresponse)|


## Approve an Agreement


<a id="opIdApproveAgreement"></a>


> Code samples


```shell
curl -X POST https://api-sandbox.split.cash/agreements/{agreement_ref}/accept \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
POST https://api-sandbox.split.cash/agreements/{agreement_ref}/accept HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/agreements/{agreement_ref}/accept',
  method: 'post'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/agreements/{agreement_ref}/accept',
{
  method: 'POST',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.post 'https://api-sandbox.split.cash/agreements/{agreement_ref}/accept', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.post('https://api-sandbox.split.cash/agreements/{agreement_ref}/accept', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/agreements/{agreement_ref}/accept");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`POST /agreements/{agreement_ref}/accept`


Approve an incoming Agreement


<h3 id="Approve-an-Agreement-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|agreement_ref|path|string|true|Single value, exact match|


> Example responses


```json
{
  "data": {
    "ref": "A.2",
    "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
    "authoriser_id": "8df89c16-330f-462b-8891-808d7bdceb7f",
    "status": "accepted",
    "responded_at": "2017-03-20T02:13:11Z",
    "created_at": "2017-03-20T00:53:27Z",
    "terms": {
      "per_payout": {
        "max_amount": 10000,
        "min_amount": 1
      },
      "per_frequency": {
        "days": 7,
        "max_amount": 1000000
      }
    }
  }
}
```


<h3 id="Approve an Agreement-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ApproveAgreementResponse](#schemaapproveagreementresponse)|


## Decline and Agreement


<a id="opIdDeclineAgreement"></a>


> Code samples


```shell
curl -X POST https://api-sandbox.split.cash/agreements/{agreement_ref}/decline \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
POST https://api-sandbox.split.cash/agreements/{agreement_ref}/decline HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/agreements/{agreement_ref}/decline',
  method: 'post'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/agreements/{agreement_ref}/decline',
{
  method: 'POST',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.post 'https://api-sandbox.split.cash/agreements/{agreement_ref}/decline', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.post('https://api-sandbox.split.cash/agreements/{agreement_ref}/decline', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/agreements/{agreement_ref}/decline");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`POST /agreements/{agreement_ref}/decline`


Decline an incoming Agreement


<h3 id="Decline-and-Agreement-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|agreement_ref|path|string|true|Single value, exact match|


> Example responses


```json
{
  "data": {
    "ref": "A.2",
    "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
    "authoriser_id": "8df89c16-330f-462b-8891-808d7bdceb7f",
    "status": "declined",
    "responded_at": "2017-03-20T02:13:11Z",
    "created_at": "2017-03-20T00:53:27Z",
    "terms": {
      "per_payout": {
        "max_amount": 10000,
        "min_amount": 1
      },
      "per_frequency": {
        "days": 7,
        "max_amount": 1000000
      }
    }
  }
}
```


<h3 id="Decline and Agreement-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[DeclineAgreementResponse](#schemadeclineagreementresponse)|


## Get an Agreement


<a id="opIdGetAgreement"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/agreements/{agreement_ref} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/agreements/{agreement_ref} HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/agreements/{agreement_ref}',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/agreements/{agreement_ref}',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/agreements/{agreement_ref}', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/agreements/{agreement_ref}', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/agreements/{agreement_ref}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /agreements/{agreement_ref}`


Get a single Agreement by its reference


<h3 id="Get-an-Agreement-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|agreement_ref|path|string|true|Single value, exact match|


> Example responses


```json
{
  "data": {
    "ref": "A.2",
    "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
    "authoriser_id": "8df89c16-330f-462b-8891-808d7bdceb7f",
    "status": "approved",
    "responded_at": "2017-03-20T02:13:11Z",
    "created_at": "2017-03-20T00:53:27Z",
    "terms": {
      "per_payout": {
        "max_amount": 10000,
        "min_amount": 1
      },
      "per_frequency": {
        "days": 7,
        "max_amount": 1000000
      }
    }
  }
}
```


<h3 id="Get an Agreement-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[GetAgreementResponse](#schemagetagreementresponse)|


## Cancel an Agreement


<a id="opIdCancelAgreement"></a>


> Code samples


```shell
curl -X DELETE https://api-sandbox.split.cash/agreements/{agreement_ref} \
  -H 'Authorization: Bearer {access_token}'


```


```http
DELETE https://api-sandbox.split.cash/agreements/{agreement_ref} HTTP/1.1
Host: api-sandbox.split.cash


```


```javascript
var headers = {
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/agreements/{agreement_ref}',
  method: 'delete'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/agreements/{agreement_ref}',
{
  method: 'DELETE',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.delete 'https://api-sandbox.split.cash/agreements/{agreement_ref}', headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Authorization': 'Bearer {access_token}'
}


r = requests.delete('https://api-sandbox.split.cash/agreements/{agreement_ref}', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/agreements/{agreement_ref}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("DELETE");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`DELETE /agreements/{agreement_ref}`


An Agreement can be cancelled by the initiator at any time whilst the authoriser (Agreement recipient) can only cancel a previously accepted Agreement.


<h3 id="Cancel-an-Agreement-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|agreement_ref|path|string|true|Single value, exact match|


<h3 id="Cancel an Agreement-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|No Content|None|


## List incoming Agreements


<a id="opIdListIncomingAgreements"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/agreements/incoming \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/agreements/incoming HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/agreements/incoming',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/agreements/incoming',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/agreements/incoming', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/agreements/incoming', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/agreements/incoming");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /agreements/incoming`


By default, all incoming Agreements will be returned. You can apply filters to your query to customise the returned Agreements.


<h3 id="List-incoming-Agreements-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|string|false|Page of results to return, single value, exact match|
|per_page|query|string|false|Number of results per page, single value, exact match|
|initiator_id|query|string|false|Initiator ID (`Contact.data.account.id`), single value, exact match|
|status|query|array[string]|false|Multiple values, exact match|


#### Enumerated Values


|Parameter|Value|
|---|---|
|status|proposed|
|status|accepted|
|status|declined|
|status|cancelled|


> Example responses


```json
{
  "data": [
    {
      "ref": "A.2",
      "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
      "authoriser_id": "8df89c16-330f-462b-8891-808d7bdceb7f",
      "status": "proposed",
      "responded_at": null,
      "created_at": "2017-03-20T00:53:27Z",
      "terms": {
        "per_payout": {
          "max_amount": 10000,
          "min_amount": 1
        },
        "per_frequency": {
          "days": 7,
          "max_amount": 1000000
        }
      }
    },
    {
      "ref": "A.1",
      "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
      "authoriser_id": "56df206a-aaff-471a-b075-11882bc8906a",
      "status": "proposed",
      "responded_at": null,
      "created_at": "2017-03-16T22:51:48Z",
      "terms": {
        "per_payout": {
          "max_amount": 5000,
          "min_amount": 0
        },
        "per_frequency": {
          "days": "1",
          "max_amount": 10000
        }
      }
    }
  ]
}
```


<h3 id="List incoming Agreements-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ListIncomingAgreementsResponse](#schemalistincomingagreementsresponse)|


## List outgoing Agreements


<a id="opIdListOutgoingAgreements"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/agreements/outgoing \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/agreements/outgoing HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/agreements/outgoing',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/agreements/outgoing',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/agreements/outgoing', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/agreements/outgoing', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/agreements/outgoing");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /agreements/outgoing`


By default, all outgoing Agreements will be returned. You can apply filters to your query to customise the returned Agreements.


<h3 id="List-outgoing-Agreements-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|string|false|Page of results to return, single value, exact match|
|per_page|query|string|false|Number of results per page, single value, exact match|
|authoriser_id|query|string|false|Authoriser ID (`Contact.data.account.id`), single value, exact match|
|status|query|array[string]|false|Exact match|


#### Enumerated Values


|Parameter|Value|
|---|---|
|status|proposed|
|status|accepted|
|status|declined|
|status|cancelled|


> Example responses


```json
{
  "data": [
    {
      "ref": "A.4",
      "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
      "authoriser_id": "8df89c16-330f-462b-8891-808d7bdceb7f",
      "status": "proposed",
      "responded_at": null,
      "created_at": "2017-03-20T00:53:27Z",
      "terms": {
        "per_payout": {
          "max_amount": 10000,
          "min_amount": 1
        },
        "per_frequency": {
          "days": 7,
          "max_amount": 1000000
        }
      }
    },
    {
      "ref": "A.3",
      "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
      "authoriser_id": "56df206a-aaff-471a-b075-11882bc8906a",
      "status": "proposed",
      "responded_at": null,
      "created_at": "2017-03-16T22:51:48Z",
      "terms": {
        "per_payout": {
          "max_amount": 5000,
          "min_amount": 0
        },
        "per_frequency": {
          "days": "1",
          "max_amount": 10000
        }
      }
    }
  ]
}
```


<h3 id="List outgoing Agreements-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ListOutgoingAgreementsResponse](#schemalistoutgoingagreementsresponse)|


<h1 id="Split-API-Bank-Accounts">Bank Accounts</h1>


Your currently linked up bank accounts.


## List all Bank Accounts


<a id="opIdListAllBankAccounts"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/bank_accounts \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/bank_accounts HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/bank_accounts',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/bank_accounts',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/bank_accounts', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/bank_accounts', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/bank_accounts");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /bank_accounts`


By default, all Bank Accounts will be returned. There can currently be only 1 active bank account.


> Example responses


```json
{
  "data": [
    {
      "id": "6a7ed958-f1e8-42dc-8c02-3901d7057357",
      "branch_code": "493192",
      "account_number": "3993013",
      "status": "active"
    },
    {
      "id": "56df206a-aaff-471a-b075-11882bc8906a",
      "branch_code": "302193",
      "account_number": "119302",
      "status": "removed"
    }
  ]
}
```


<h3 id="List all Bank Accounts-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ListAllBankAccountsResponse](#schemalistallbankaccountsresponse)|


<h1 id="Split-API-Contacts">Contacts</h1>


Your Contacts form an address book of Split accounts and non-Split accounts (Anyone accounts) with whom you can interact. In order to initiate any type of transaction you must first have the party in your Contact list.


There are a few IDs supplied within a Contact's response:


1. `data.id` represents the Contact resource.
2. `data.bank_account.id` represents the Contact's bank account and is used when creating Payments or Payment Requests.
3. `data.account.id` represents the Contact's Split account and is used when proposing Agreements.


<aside class="notice">In the case of Open Payment Requests & Open Agreements, the authorising party will be automatically added to your Contacts list.</aside>


## Add a Split Contact


<a id="opIdAddASplitContact"></a>


> Code samples


```shell
curl -X POST https://api-sandbox.split.cash/contacts \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}' \
  -d '{
  "nickname": "outstanding_tours"
}'


```


```http
POST https://api-sandbox.split.cash/contacts HTTP/1.1
Host: api-sandbox.split.cash
Content-Type: application/json
Accept: application/json


```


```javascript
var headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


var body = '{
  "nickname": "outstanding_tours"
}';


$.ajax({
  url: 'https://api-sandbox.split.cash/contacts',
  method: 'post',
  data: body,
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');
const inputBody = '{
  "nickname": "outstanding_tours"
}';
const headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/contacts',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


params = '{
  "nickname": "outstanding_tours"
}'


result = RestClient.post 'https://api-sandbox.split.cash/contacts', params, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.post('https://api-sandbox.split.cash/contacts', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/contacts");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`POST /contacts`


Add a Split Contact


> Body parameter


```json
{
  "nickname": "outstanding_tours"
}
```


<h3 id="Add-a-Split-Contact-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[AddASplitContactRequest](#schemaaddasplitcontactrequest)|true|No description|
|» nickname|body|string|true|Split account nickname|


> Example responses


```json
{
  "data": {
    "id": "6a7ed958-f1e8-42dc-8c02-3901d7057357",
    "name": "Outstanding Tours Pty Ltd",
    "email": "accounts@outstandingtours.com.au",
    "type": "Split account",
    "bank_account": {
      "id": "55afddde-4296-4daf-8e49-7ba481ef9608",
      "account_number": "947434694",
      "branch_code": "304304",
      "state": "verified"
    },
    "account": {
      "id": "77be6ecc-5fa7-454b-86d6-02a5f147878d",
      "nickname": "outstanding_tours",
      "abn": "123456789",
      "name": "Outstanding Tours Pty Ltd"
    }
  }
}
```


<h3 id="Add a Split Contact-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Created|[AddASplitContactResponse](#schemaaddasplitcontactresponse)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not Found|None|


## List all Contacts


<a id="opIdListAllContacts"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/contacts \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/contacts HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/contacts',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/contacts',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/contacts', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/contacts', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/contacts");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /contacts`


By default, all Contacts will be returned. You can apply filters to your query to customise the returned Contact list.


<h3 id="List-all-Contacts-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|string|false|Page of results to return, single value, exact match|
|per_page|query|string|false|Number of results per page, single value, exact match|
|account_id|query|string|false|Single value, string search|
|name|query|string|false|Single value, string search|
|nickname|query|string|false|Single value, string search|
|bank_account_id|query|string|false|Single value, exact match|
|bank_account_branch_code|query|string|false|Single value, exact match|
|bank_account_account_number|query|string|false|Single value, exact match|


> Example responses


```json
{
  "data": [
    {
      "id": "6a7ed958-f1e8-42dc-8c02-3901d7057357",
      "name": "Outstanding Tours Pty Ltd",
      "email": "accounts@outstandingtours.com.au",
      "type": "Split account",
      "bank_account": {
        "id": "095c5ab7-7fa8-40fd-b317-cddbbf4c8fbc",
        "account_number": "494307",
        "branch_code": "435434",
        "state": "verified"
      },
      "account": {
        "id": "77be6ecc-5fa7-454b-86d6-02a5f147878d",
        "nickname": "outstanding_tours",
        "abn": "123456789",
        "name": "Outstanding Tours Pty Ltd"
      }
    },
    {
      "id": "49935c67-c5df-4f00-99f4-1413c18a89a0",
      "name": "Adventure Dudes Pty Ltd",
      "email": "accounts@adventuredudes.com.au",
      "type": "Split account",
      "bank_account": {
        "id": "861ff8e4-7acf-4897-9e53-e7c5ae5f7cc0",
        "account_number": "4395959",
        "branch_code": "068231",
        "state": "verified"
      },
      "account": {
        "id": "362f7fe8-4af2-4902-b3d7-b5ab704ef2e7",
        "nickname": "adventure_dudes",
        "abn": "126754389",
        "name": "Adventure Dudes Pty Ltd"
      }
    },
    {
      "id": "eb3266f9-e172-4b6c-b802-fe5ac4d3250a",
      "name": "Surfing World Pty Ltd",
      "email": "accounts@surfingworld.com.au",
      "type": "Split account",
      "bank_account": {
        "id": "N/A",
        "account_number": "N/A",
        "branch_code": "N/A",
        "state": "disabled"
      },
      "account": {
        "id": "a31dc907-9c7a-4736-84c9-1149cf03de42",
        "nickname": "surfing_world",
        "abn": "295443789",
        "name": "Surfing World Pty Ltd"
      }
    },
    {
      "id": "6a7ed958-f1e8-42dc-8c02-3901d7057357",
      "name": "Hunter Thompson",
      "email": "hunter@batcountry.com",
      "type": "anyone",
      "bank_account": {
        "id": "55afddde-4296-4daf-8e49-7ba481ef9608",
        "account_number": "13048322",
        "branch_code": "123456",
        "state": "pending_verification"
      },
      "anyone_account": {
        "id": "77be6ecc-5fa7-454b-86d6-02a5f147878d"
      }
    }
  ]
}
```


<h3 id="List all Contacts-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ListAllContactsResponse](#schemalistallcontactsresponse)|


## Add an Anyone Contact


<a id="opIdAddAnAnyoneContact"></a>


> Code samples


```shell
curl -X POST https://api-sandbox.split.cash/contacts/anyone \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}' \
  -d '{
  "name": "Hunter Thompson",
  "email": "hunter@batcountry.com",
  "branch_code": "123456",
  "account_number": "13048322"
}'


```


```http
POST https://api-sandbox.split.cash/contacts/anyone HTTP/1.1
Host: api-sandbox.split.cash
Content-Type: application/json
Accept: application/json


```


```javascript
var headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


var body = '{
  "name": "Hunter Thompson",
  "email": "hunter@batcountry.com",
  "branch_code": "123456",
  "account_number": "13048322"
}';


$.ajax({
  url: 'https://api-sandbox.split.cash/contacts/anyone',
  method: 'post',
  data: body,
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');
const inputBody = '{
  "name": "Hunter Thompson",
  "email": "hunter@batcountry.com",
  "branch_code": "123456",
  "account_number": "13048322"
}';
const headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/contacts/anyone',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


params = '{
  "name": "Hunter Thompson",
  "email": "hunter@batcountry.com",
  "branch_code": "123456",
  "account_number": "13048322"
}'


result = RestClient.post 'https://api-sandbox.split.cash/contacts/anyone', params, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.post('https://api-sandbox.split.cash/contacts/anyone', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/contacts/anyone");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`POST /contacts/anyone`


When you want to pay somebody that doesn't have a Split account, you can add them as an Anyone Contact.


<aside class="notice">
  Anyone Contacts added this way can be used solely as payout recipients in a Payment.
</aside>


> Body parameter


```json
{
  "name": "Hunter Thompson",
  "email": "hunter@batcountry.com",
  "branch_code": "123456",
  "account_number": "13048322"
}
```


<h3 id="Add-an-Anyone-Contact-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[AddAnAnyoneContactRequest](#schemaaddananyonecontactrequest)|true|No description|
|» name|body|string|true|The name of the Contact|
|» email|body|string|true|The email of the Contact|
|» branch_code|body|string|true|The bank account BSB of the Contact|
|» account_number|body|string|true|The bank account number of the Contact|


> Example responses


```json
{
  "data": {
    "id": "6a7ed958-f1e8-42dc-8c02-3901d7057357",
    "name": "Hunter Thompson",
    "email": "hunter@batcountry.com",
    "type": "anyone",
    "bank_account": {
      "id": "55afddde-4296-4daf-8e49-7ba481ef9608",
      "account_number": "13048322",
      "branch_code": "123456",
      "state": "pending_verification"
    },
    "anyone_account": {
      "id": "77be6ecc-5fa7-454b-86d6-02a5f147878d"
    }
  }
}
```


<h3 id="Add an Anyone Contact-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Created|[AddAnAnyoneContactResponse](#schemaaddananyonecontactresponse)|


## Get a Contact


<a id="opIdGetAContact"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/contacts/{id} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/contacts/{id} HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/contacts/{id}',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/contacts/{id}',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/contacts/{id}', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/contacts/{id}', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/contacts/{id}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /contacts/{id}`


Get a single Contact by its ID


<h3 id="Get-a-Contact-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string(UUID)|true|Contact ID (`Contact.data.id`)|


> Example responses


```json
{
  "data": {
    "id": "fcabeacb-2ef6-4b27-ba19-4f6fa0d57dcb",
    "name": "Outstanding Tours Pty Ltd",
    "email": "accounts@outstandingtours.com.au",
    "type": "Split account",
    "bank_account": {
      "id": "55afddde-4296-4daf-8e49-7ba481ef9608",
      "account_number": "947434694",
      "branch_code": "304304",
      "state": "pending_verification"
    },
    "account": {
      "id": "77be6ecc-5fa7-454b-86d6-02a5f147878d",
      "nickname": "outstanding_tours",
      "abn": "123456789",
      "name": "Outstanding Tours Pty Ltd"
    }
  }
}
```


<h3 id="Get a Contact-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[GetAContactResponse](#schemagetacontactresponse)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not Found|None|


## Remove a Contact


<a id="opIdRemoveAContact"></a>


> Code samples


```shell
curl -X DELETE https://api-sandbox.split.cash/contacts/{id} \
  -H 'Authorization: Bearer {access_token}'


```


```http
DELETE https://api-sandbox.split.cash/contacts/{id} HTTP/1.1
Host: api-sandbox.split.cash


```


```javascript
var headers = {
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/contacts/{id}',
  method: 'delete'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/contacts/{id}',
{
  method: 'DELETE',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.delete 'https://api-sandbox.split.cash/contacts/{id}', headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Authorization': 'Bearer {access_token}'
}


r = requests.delete('https://api-sandbox.split.cash/contacts/{id}', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/contacts/{id}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("DELETE");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`DELETE /contacts/{id}`


<aside class="notice">Removing a Contact will not affect your transaction history.</aside>


<h3 id="Remove-a-Contact-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string(UUID)|true|Contact ID (`Contact.data.id`)|


<h3 id="Remove a Contact-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|No description|None|


## Update a Contact


<a id="opIdUpdateAContact"></a>


> Code samples


```shell
curl -X PATCH https://api-sandbox.split.cash/contacts/{id} \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}' \
  -d '{
  "name": "My very own alias"
}'


```


```http
PATCH https://api-sandbox.split.cash/contacts/{id} HTTP/1.1
Host: api-sandbox.split.cash
Content-Type: application/json
Accept: application/json


```


```javascript
var headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


var body = '{
  "name": "My very own alias"
}';


$.ajax({
  url: 'https://api-sandbox.split.cash/contacts/{id}',
  method: 'patch',
  data: body,
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');
const inputBody = '{
  "name": "My very own alias"
}';
const headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/contacts/{id}',
{
  method: 'PATCH',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


params = '{
  "name": "My very own alias"
}'


result = RestClient.patch 'https://api-sandbox.split.cash/contacts/{id}', params, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.patch('https://api-sandbox.split.cash/contacts/{id}', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/contacts/{id}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("PATCH");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`PATCH /contacts/{id}`


You can update the name of any Contact. This is essentially an alias you can use to provide something contextually meaninful.


<aside class="notice">
  Any previous transactions to that Contact will retain the Contact name that was current at the time.
</aside>


> Body parameter


```json
{
  "name": "My very own alias"
}
```


<h3 id="Update-a-Contact-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|id|path|string|true|Contact ID (`Contact.data.id`)|
|body|body|[UpdateAContactRequest](#schemaupdateacontactrequest)|true|No description|
|» name|body|string|true|The name of the Contact|


> Example responses


```json
{
  "data": {
    "id": "fcabeacb-2ef6-4b27-ba19-4f6fa0d57dcb",
    "name": "My very own alias",
    "email": "accounts@outstandingtours.com.au",
    "type": "Split account",
    "bank_account": {
      "id": "55afddde-4296-4daf-8e49-7ba481ef9608",
      "account_number": "947434694",
      "branch_code": "304304",
      "state": "pending_verification"
    },
    "account": {
      "id": "77be6ecc-5fa7-454b-86d6-02a5f147878d",
      "nickname": "outstanding_tours",
      "abn": "123456789",
      "name": "Outstanding Tours Pty Ltd"
    }
  }
}
```


<h3 id="Update a Contact-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[UpdateAContactResponse](#schemaupdateacontactresponse)|
|404|[Not Found](https://tools.ietf.org/html/rfc7231#section-6.5.4)|Not Found|None|


<h1 id="Split-API-Open-Agreements">Open Agreements</h1>


An Open Agreement is essentially an Agreement template with no specific authoriser. Each time an Open Agreement is accepted by either a Split account holder or anyone, the authoriser is added to your Contacts list and a new Agreement is automatically created between the Open Agreement initiator and the authoriser.


An Open Agreement can be accepted multiple times by different parties and the result is the same: A new Agreement. Additionally, an Open Agreement can be accepted by anybody, not just other Split users. This is achieved by using our [Instant Account Verification process](http://help.split.cash/bank-accounts/instant-account-verification-iav) as part of accepting an [Open Agreement](https://help.split.cash/agreements/open-agreement).


##Lifecycle


An Open Agreement can have the following statuses:


| Status | Description |
|-------|-------------|
| `active` | The Open Agreement can be viewed and accepted. |
| `closed` | The Open Agreement can not be viewed or accepted. |


<aside class="notice">When you close an Open Agreement, no new Agreements can be created from it and all past Agreement resulting from the acceptance of the Open Agreement are unaffected.</aside>


## Create an Open Agreement


<a id="opIdCreateOpenAgreement"></a>


> Code samples


```shell
curl -X POST https://api-sandbox.split.cash/open_agreements \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}' \
  -d '{
  "title": "Subscription Plan A",
  "terms": {
    "per_payout": {
      "min_amount": null,
      "max_amount": 10000
    },
    "per_frequency": {
      "days": 7,
      "max_amount": 1000000
    }
  }
}'


```


```http
POST https://api-sandbox.split.cash/open_agreements HTTP/1.1
Host: api-sandbox.split.cash
Content-Type: application/json
Accept: application/json


```


```javascript
var headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


var body = '{
  "title": "Subscription Plan A",
  "terms": {
    "per_payout": {
      "min_amount": null,
      "max_amount": 10000
    },
    "per_frequency": {
      "days": 7,
      "max_amount": 1000000
    }
  }
}';


$.ajax({
  url: 'https://api-sandbox.split.cash/open_agreements',
  method: 'post',
  data: body,
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');
const inputBody = '{
  "title": "Subscription Plan A",
  "terms": {
    "per_payout": {
      "min_amount": null,
      "max_amount": 10000
    },
    "per_frequency": {
      "days": 7,
      "max_amount": 1000000
    }
  }
}';
const headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/open_agreements',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


params = '{
  "title": "Subscription Plan A",
  "terms": {
    "per_payout": {
      "min_amount": null,
      "max_amount": 10000
    },
    "per_frequency": {
      "days": 7,
      "max_amount": 1000000
    }
  }
}'


result = RestClient.post 'https://api-sandbox.split.cash/open_agreements', params, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.post('https://api-sandbox.split.cash/open_agreements', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/open_agreements");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`POST /open_agreements`


Create an Open Agreement that can be accepted by anyone.


<aside class="notice">You can set any of the term metrics to <code>null</code> if you wish them to not have a limit.</aside>


> Body parameter


```json
{
  "title": "Subscription Plan A",
  "terms": {
    "per_payout": {
      "min_amount": null,
      "max_amount": 10000
    },
    "per_frequency": {
      "days": 7,
      "max_amount": 1000000
    }
  }
}
```


<h3 id="Create-an-Open-Agreement-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[CreateOpenAgreementRequest](#schemacreateopenagreementrequest)|true|No description|
|» title|body|string|true|Title of the Open Agreement (Visible to authorisers)|
|» terms|body|[Terms](#schematerms)|true|Terms|
|»» per_payout|body|[PerPayout](#schemaperpayout)|true|No description|
|»»» min_amount|body|number|false|Minimum amount in cents a PR can be in order to be auto-approved|
|»»» max_amount|body|number|false|Maximum amount in cents a PR can be in order to be auto-approved|
|»» per_frequency|body|[PerFrequency](#schemaperfrequency)|true|No description|
|»»» days|body|number|false|Amount of days to apply against the frequency|
|»»» max_amount|body|number|false|Maximum amount in cents the total of all PRs can be for the duration of the frequency|


> Example responses


```json
{
  "data": {
    "ref": "OA.1",
    "title": "Subscription Plan A",
    "status": "active",
    "created_at": "2017-03-20T00:53:27Z",
    "terms": {
      "per_payout": {
        "min_amount": null,
        "max_amount": 10000
      },
      "per_frequency": {
        "days": 7,
        "max_amount": 1000000
      }
    }
  }
}
```


<h3 id="Create an Open Agreement-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Created|[CreateOpenAgreementResponse](#schemacreateopenagreementresponse)|


## List all Open Agreements


<a id="opIdListAllOpenAgreements"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/open_agreements \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/open_agreements HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/open_agreements',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/open_agreements',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/open_agreements', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/open_agreements', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/open_agreements");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /open_agreements`


<h3 id="List-all-Open-Agreements-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|string|false|Page of results to return, single value, exact match|
|per_page|query|string|false|Number of results per page, single value, exact match|


> Example responses


```json
{
  "data": [
    {
      "ref": "OA.1",
      "title": "Subscription Plan A",
      "status": "active",
      "created_at": "2017-03-20T00:53:27Z",
      "terms": {
        "per_payout": {
          "max_amount": 10000,
          "min_amount": null
        },
        "per_frequency": {
          "days": 7,
          "max_amount": 1000000
        }
      },
      "link": "https://go-sandbox.split.cash/open_agreements/2e002c0b-ffaf-44eb-a35c-15fa384ddde1/agreements/invitation"
    },
    {
      "ref": "OA.2",
      "title": "Subscription Plan B",
      "status": "closed",
      "created_at": "2017-03-20T00:53:27Z",
      "terms": {
        "per_payout": {
          "max_amount": 10000,
          "min_amount": null
        },
        "per_frequency": {
          "days": null,
          "max_amount": null
        }
      },
      "link": "https://go-sandbox.split.cash/open_agreements/948e3662-154d-42d1-bdc9-a05c251d3981/agreements/invitation"
    }
  ]
}
```


<h3 id="List all Open Agreements-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ListAllOpenAgreementsResponse](#schemalistallopenagreementsresponse)|


## Activate a closed Open Agreement


<a id="opIdActivateOpenAgreement"></a>


> Code samples


```shell
curl -X POST https://api-sandbox.split.cash/open_agreements/{open_agreement_ref}/activate \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
POST https://api-sandbox.split.cash/open_agreements/{open_agreement_ref}/activate HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/open_agreements/{open_agreement_ref}/activate',
  method: 'post'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/open_agreements/{open_agreement_ref}/activate',
{
  method: 'POST',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.post 'https://api-sandbox.split.cash/open_agreements/{open_agreement_ref}/activate', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.post('https://api-sandbox.split.cash/open_agreements/{open_agreement_ref}/activate', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/open_agreements/{open_agreement_ref}/activate");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`POST /open_agreements/{open_agreement_ref}/activate`


Allow the Open Agreement to viewed and accepted


<h3 id="Activate-a-closed-Open-Agreement-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|open_agreement_ref|path|string|true|Single value, exact match|


> Example responses


```json
{
  "data": {
    "ref": "OA.1",
    "title": "Subscription Plan A",
    "status": "active",
    "created_at": "2017-03-20T00:53:27Z",
    "terms": {
      "per_payout": {
        "max_amount": 10000,
        "min_amount": null
      },
      "per_frequency": {
        "days": 7,
        "max_amount": 1000000
      }
    },
    "link": "https://go-sandbox.split.cash/open_agreements/2e002c0b-ffaf-44eb-a35c-15fa384ddde1/agreements/invitation"
  }
}
```


<h3 id="Activate a closed Open Agreement-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ActivateOpenAgreementResponse](#schemaactivateopenagreementresponse)|


## Close an active Open Agreement


<a id="opIdCloseOpenAgreement"></a>


> Code samples


```shell
curl -X POST https://api-sandbox.split.cash/open_agreements/{open_agreement_ref}/close \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
POST https://api-sandbox.split.cash/open_agreements/{open_agreement_ref}/close HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/open_agreements/{open_agreement_ref}/close',
  method: 'post'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/open_agreements/{open_agreement_ref}/close',
{
  method: 'POST',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.post 'https://api-sandbox.split.cash/open_agreements/{open_agreement_ref}/close', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.post('https://api-sandbox.split.cash/open_agreements/{open_agreement_ref}/close', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/open_agreements/{open_agreement_ref}/close");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`POST /open_agreements/{open_agreement_ref}/close`


Disable the Open Agreement from being viewed or accepted


<h3 id="Close-an-active-Open-Agreement-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|open_agreement_ref|path|string|true|Single value, exact match|


> Example responses


```json
{
  "data": {
    "ref": "OA.1",
    "title": "Subscription Plan A",
    "status": "closed",
    "created_at": "2017-03-20T00:53:27Z",
    "terms": {
      "per_payout": {
        "max_amount": 10000,
        "min_amount": null
      },
      "per_frequency": {
        "days": 7,
        "max_amount": 1000000
      }
    },
    "link": "https://go-sandbox.split.cash/open_agreements/2e002c0b-ffaf-44eb-a35c-15fa384ddde1/agreements/invitation"
  }
}
```


<h3 id="Close an active Open Agreement-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[CloseOpenAgreementResponse](#schemacloseopenagreementresponse)|


<h1 id="Split-API-Payments">Payments</h1>


**A Payment is made up of two parts:**


1. General details about the Payment.
2. One or many Payouts with individual recipients, amounts and descriptions.


##Lifecycle


The Payment is simply a group of Payouts therefore it does not have a particular status. Its Payouts however have their status regularly updated, for a list of possible Payout statuses check out the [Transactions](/#Split-API-Transactions).


## Make a Payment


<a id="opIdMakeAPayment"></a>


> Code samples


```shell
curl -X POST https://api-sandbox.split.cash/payments \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}' \
  -d '{
  "description": "The SuperPackage",
  "matures_at": "2016-09-13T00:00:00Z",
  "payouts": [
    {
      "amount": 30000,
      "description": "A tandem skydive jump SB23094",
      "recipient_id": "48b89364-1577-4c81-ba02-96705895d457",
      "metadata": {
        "invoice_ref": "BILL-0001",
        "invoice_id": "c80a9958-e805-47c0-ac2a-c947d7fd778d",
        "custom_key": "Custom string",
        "another_custom_key": "Maybe a URL"
      }
    },
    {
      "amount": 30000,
      "description": "A scuba dive SDS5464",
      "recipient_id": "dc6f1e60-3803-43ca-a200-7d641816f57f"
    }
  ],
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}'


```


```http
POST https://api-sandbox.split.cash/payments HTTP/1.1
Host: api-sandbox.split.cash
Content-Type: application/json
Accept: application/json


```


```javascript
var headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


var body = '{
  "description": "The SuperPackage",
  "matures_at": "2016-09-13T00:00:00Z",
  "payouts": [
    {
      "amount": 30000,
      "description": "A tandem skydive jump SB23094",
      "recipient_id": "48b89364-1577-4c81-ba02-96705895d457",
      "metadata": {
        "invoice_ref": "BILL-0001",
        "invoice_id": "c80a9958-e805-47c0-ac2a-c947d7fd778d",
        "custom_key": "Custom string",
        "another_custom_key": "Maybe a URL"
      }
    },
    {
      "amount": 30000,
      "description": "A scuba dive SDS5464",
      "recipient_id": "dc6f1e60-3803-43ca-a200-7d641816f57f"
    }
  ],
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}';


$.ajax({
  url: 'https://api-sandbox.split.cash/payments',
  method: 'post',
  data: body,
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');
const inputBody = '{
  "description": "The SuperPackage",
  "matures_at": "2016-09-13T00:00:00Z",
  "payouts": [
    {
      "amount": 30000,
      "description": "A tandem skydive jump SB23094",
      "recipient_id": "48b89364-1577-4c81-ba02-96705895d457",
      "metadata": {
        "invoice_ref": "BILL-0001",
        "invoice_id": "c80a9958-e805-47c0-ac2a-c947d7fd778d",
        "custom_key": "Custom string",
        "another_custom_key": "Maybe a URL"
      }
    },
    {
      "amount": 30000,
      "description": "A scuba dive SDS5464",
      "recipient_id": "dc6f1e60-3803-43ca-a200-7d641816f57f"
    }
  ],
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}';
const headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/payments',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


params = '{
  "description": "The SuperPackage",
  "matures_at": "2016-09-13T00:00:00Z",
  "payouts": [
    {
      "amount": 30000,
      "description": "A tandem skydive jump SB23094",
      "recipient_id": "48b89364-1577-4c81-ba02-96705895d457",
      "metadata": {
        "invoice_ref": "BILL-0001",
        "invoice_id": "c80a9958-e805-47c0-ac2a-c947d7fd778d",
        "custom_key": "Custom string",
        "another_custom_key": "Maybe a URL"
      }
    },
    {
      "amount": 30000,
      "description": "A scuba dive SDS5464",
      "recipient_id": "dc6f1e60-3803-43ca-a200-7d641816f57f"
    }
  ],
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}'


result = RestClient.post 'https://api-sandbox.split.cash/payments', params, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.post('https://api-sandbox.split.cash/payments', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/payments");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`POST /payments`


> Body parameter


```json
{
  "description": "The SuperPackage",
  "matures_at": "2016-09-13T00:00:00Z",
  "payouts": [
    {
      "amount": 30000,
      "description": "A tandem skydive jump SB23094",
      "recipient_id": "48b89364-1577-4c81-ba02-96705895d457",
      "metadata": {
        "invoice_ref": "BILL-0001",
        "invoice_id": "c80a9958-e805-47c0-ac2a-c947d7fd778d",
        "custom_key": "Custom string",
        "another_custom_key": "Maybe a URL"
      }
    },
    {
      "amount": 30000,
      "description": "A scuba dive SDS5464",
      "recipient_id": "dc6f1e60-3803-43ca-a200-7d641816f57f"
    }
  ],
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}
```


<h3 id="Make-a-Payment-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[MakeAPaymentRequest](#schemamakeapaymentrequest)|true|No description|
|» description|body|string|true|User description. Only visible to the payer|
|» matures_at|body|string|true|Date & time in UTC ISO8601 the Payment should be processed|
|» payouts|body|[[Payout](#schemapayout)]|true|One or many Payouts|
|»» Payout|body|[Payout](#schemapayout)|false|The actual Payout|
|»»» amount|body|number|true|Amount in cents to pay the recipient|
|»»» description|body|string|true|Description that both the payer an recipient can see|
|»»» recipient_id|body|string|true|Contact bank account to pay (`Contact.data.bank_account.id`)|
|»»» metadata|body|[Metadata](#schemametadata)|false|Use for your custom data an certain Split customisations|
|»» metadata|body|[Metadata](#schemametadata)|false|Use for your custom data an certain Split customisations|


> Example responses


```json
{
  "data": {
    "ref": "PB.1",
    "payouts": [
      {
        "ref": "D.1",
        "invoice_ref": "BILL-0001",
        "batch_description": "The SuperPackage",
        "matures_at": "2016-09-13T23:50:44Z",
        "created_at": "2016-09-10T23:50:44Z",
        "status": "maturing",
        "amount": 30000,
        "description": "A tandem skydive jump SB23094",
        "from_id": "83623359-e86e-440c-9780-432a3bc3626f",
        "to_id": "48b89364-1577-4c81-ba02-96705895d457",
        "metadata": {
          "invoice_ref": "BILL-0001",
          "invoice_id": "c80a9958-e805-47c0-ac2a-c947d7fd778d",
          "custom_key": "Custom string",
          "another_custom_key": "Maybe a URL"
        }
      },
      {
        "ref": "D.2",
        "invoice_ref": null,
        "batch_description": "The SuperPackage",
        "matures_at": "2016-09-13T23:50:44Z",
        "created_at": "2016-09-10T23:50:44Z",
        "status": "maturing",
        "amount": 30000,
        "description": "A scuba dive SDS5464",
        "from_id": "48b89364-1577-4c81-ba02-96705895d457",
        "to_id": "dc6f1e60-3803-43ca-a200-7d641816f57f"
      }
    ],
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


<h3 id="Make a Payment-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Created|[MakeAPaymentResponse](#schemamakeapaymentresponse)|


## List all Payments


<a id="opIdListAllPayments"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/payments \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/payments HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/payments',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/payments',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/payments', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/payments', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/payments");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /payments`


<h3 id="List-all-Payments-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|string|false|Page of results to return, single value, exact match|
|per_page|query|string|false|Number of results per page, single value, exact match|


> Example responses


```json
{
  "data": [
    {
      "ref": "PB.1",
      "payouts": [
        {
          "ref": "D.1",
          "invoice_ref": null,
          "batch_description": "This description is only available to the payer",
          "matures_at": "2016-09-13T23:50:44Z",
          "created_at": "2016-09-10T23:50:44Z",
          "status": "maturing",
          "amount": 30000,
          "description": "The recipient will see this description",
          "from_id": "83623359-e86e-440c-9780-432a3bc3626f",
          "to_id": "48b89364-1577-4c81-ba02-96705895d457",
          "metadata": {
            "invoice_ref": "BILL-0001",
            "invoice_id": "c80a9958-e805-47c0-ac2a-c947d7fd778d",
            "custom_key": "Custom string",
            "another_custom_key": "Maybe a URL"
          }
        },
        {
          "ref": "D.2",
          "invoice_ref": null,
          "batch_description": "This description is only available to the payer",
          "matures_at": "2016-09-13T23:50:44Z",
          "created_at": "2016-09-10T23:50:44Z",
          "status": "maturing",
          "amount": 30000,
          "description": "The recipient will see this description",
          "from_id": "48b89364-1577-4c81-ba02-96705895d457",
          "to_id": "dc6f1e60-3803-43ca-a200-7d641816f57f"
        }
      ],
      "metadata": {
        "custom_key": "Custom string",
        "another_custom_key": "Maybe a URL"
      }
    }
  ]
}
```


<h3 id="List all Payments-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ListAllPaymentsResponse](#schemalistallpaymentsresponse)|


## Get a Payment


<a id="opIdGetAPayment"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/payments/{payment_ref} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/payments/{payment_ref} HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/payments/{payment_ref}',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/payments/{payment_ref}',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/payments/{payment_ref}', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/payments/{payment_ref}', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/payments/{payment_ref}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /payments/{payment_ref}`


Get a single payment by its reference


<h3 id="Get-a-Payment-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|payment_ref|path|string|true|Payment reference|


> Example responses


```json
{
  "data": {
    "ref": "PB.1",
    "payouts": [
      {
        "ref": "D.1",
        "invoice_ref": null,
        "batch_description": "The SuperPackage",
        "matures_at": "2016-09-13T23:50:44Z",
        "created_at": "2016-09-10T23:50:44",
        "status": "maturing",
        "amount": 30000,
        "description": "A tandem skydive jump SB23094",
        "from_id": "83623359-e86e-440c-9780-432a3bc3626f",
        "to_id": "48b89364-1577-4c81-ba02-96705895d457",
        "metadata": {
          "invoice_ref": "BILL-0001",
          "invoice_id": "c80a9958-e805-47c0-ac2a-c947d7fd778d",
          "custom_key": "Custom string",
          "another_custom_key": "Maybe a URL"
        }
      },
      {
        "ref": "D.2",
        "invoice_ref": null,
        "batch_description": "The SuperPackage",
        "matures_at": "2016-09-13T23:50:44Z",
        "created_at": "2016-09-10T23:50:44Z",
        "status": "maturing",
        "amount": 30000,
        "description": "A scuba dive SDS5464",
        "from_id": "48b89364-1577-4c81-ba02-96705895d457",
        "to_id": "dc6f1e60-3803-43ca-a200-7d641816f57f"
      }
    ],
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


<h3 id="Get a Payment-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[GetAPaymentResponse](#schemagetapaymentresponse)|


<h1 id="Split-API-Payouts">Payouts</h1>


Payouts are what a compose a Payment. One or all Payouts can be voided individually as part of the larger Payment.


## Void a Payout


<a id="opIdVoidAPayout"></a>


> Code samples


```shell
curl -X DELETE https://api-sandbox.split.cash/payouts/{debit_ref} \
  -H 'Authorization: Bearer {access_token}'


```


```http
DELETE https://api-sandbox.split.cash/payouts/{debit_ref} HTTP/1.1
Host: api-sandbox.split.cash


```


```javascript
var headers = {
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/payouts/{debit_ref}',
  method: 'delete'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/payouts/{debit_ref}',
{
  method: 'DELETE',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.delete 'https://api-sandbox.split.cash/payouts/{debit_ref}', headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Authorization': 'Bearer {access_token}'
}


r = requests.delete('https://api-sandbox.split.cash/payouts/{debit_ref}', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/payouts/{debit_ref}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("DELETE");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`DELETE /payouts/{debit_ref}`


You can void any Payout debit from your account that has not yet matured. In the case where it has matured, you can send a Refund Request to the Payout recipient once the Payout has successfully cleared in order to reverse the transaction.


<h3 id="Void-a-Payout-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|debit_ref|path|string|true|Payout debit reference|


<h3 id="Void a Payout-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|No Content|None|


<h1 id="Split-API-Payment-Requests">Payment Requests</h1>


A Payment Request (PR) is used to request payment from another party. Additionally, a Payment Request can be approved by anybody, not just other Split users. This is achieved by using our [Instant Account Verification process](http://help.split.cash/bank-accounts/instant-account-verification-iav) as part of approving a [Payment Request](https://help.split.cash/payment-requests/open-payment-requests).


<div class="middle-header">Applicable scenarios</div>


1. **A Split account sends a PR to a Contact that is a Split account:**
    1. The authoriser must either approve or decline the request; **or**
    2. Given there is an Agreement in place and the PR is within the terms of the Agreement, then the PR will be automatically approved; **or**
    3. Given the PR is **not** within the terms of the Agreement, then the authoriser must either approve or decline the request.
2. **A Split accounts sends a PR to a Contact that is not a Split account:**
    1. Given there is an Agreement in place and the PR is within the terms of the Agreement, then the PR will be automatically approved; **or**
    2. Given the PR is **not** within the terms of the Agreement, then the PR will not be created; **or**
    3. There is no Agreement in place, then the PR will not be created.


<div class="middle-header">Direction</div>


Payment Requests are broken up by direction:


1. **Incoming:** An incoming Payment Request (you are the authoriser/payer)
2. **Outgoing:** An outgoing Payment Request (you are the initiator/payee)


There are two response fields that differ depending on the direction:


| Field | Description |
|-------|-------------|
| `debit_ref` | Only visible to the PR authoriser (incoming PRs). This reference corresponds to the newly created debit to process the approved PR. |
| `credit_ref` | Only visible to the PR initiator (outgoing PRs). This reference corresponds to the newly created credit from the approved PR. |


##Lifecycle


A Payment Request can have the following statuses:


| Status | Description |
|-------|-------------|
| `pending_approval` | Waiting for the authoriser to approve the PR. |
| `approved` | The authoriser has approved the PR. |
| `declined` | The payer has declined the PR. |
| `cancelled` | The initiator has cancelled the PR. |


## Request Payment


<a id="opIdMakeAPaymentRequest"></a>


> Code samples


```shell
curl -X POST https://api-sandbox.split.cash/payment_requests \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}' \
  -d '{
  "description": "Visible to both initiator and authoriser",
  "matures_at": "12/19/2016 2:10:56 AM",
  "amount": 99000,
  "authoriser_id": "de86472c-c027-4735-a6a7-234366a27fc7",
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}'


```


```http
POST https://api-sandbox.split.cash/payment_requests HTTP/1.1
Host: api-sandbox.split.cash
Content-Type: application/json
Accept: application/json


```


```javascript
var headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


var body = '{
  "description": "Visible to both initiator and authoriser",
  "matures_at": "12/19/2016 2:10:56 AM",
  "amount": 99000,
  "authoriser_id": "de86472c-c027-4735-a6a7-234366a27fc7",
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}';


$.ajax({
  url: 'https://api-sandbox.split.cash/payment_requests',
  method: 'post',
  data: body,
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');
const inputBody = '{
  "description": "Visible to both initiator and authoriser",
  "matures_at": "12/19/2016 2:10:56 AM",
  "amount": 99000,
  "authoriser_id": "de86472c-c027-4735-a6a7-234366a27fc7",
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}';
const headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/payment_requests',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


params = '{
  "description": "Visible to both initiator and authoriser",
  "matures_at": "12/19/2016 2:10:56 AM",
  "amount": 99000,
  "authoriser_id": "de86472c-c027-4735-a6a7-234366a27fc7",
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}'


result = RestClient.post 'https://api-sandbox.split.cash/payment_requests', params, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.post('https://api-sandbox.split.cash/payment_requests', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/payment_requests");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`POST /payment_requests`


> Body parameter


```json
{
  "description": "Visible to both initiator and authoriser",
  "matures_at": "12/19/2016 2:10:56 AM",
  "amount": 99000,
  "authoriser_id": "de86472c-c027-4735-a6a7-234366a27fc7",
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}
```


<h3 id="Request-Payment-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[MakeAPaymentRequestRequest](#schemamakeapaymentrequestrequest)|true|No description|
|» description|body|string|true|Description visible to the initiator (payee) & authoriser (payer)|
|» matures_at|body|string|true|Date & time in UTC ISO8601 that the Payment will be processed if the request is approved|
|» amount|body|number|true|Amount in cents to pay the initiator|
|» authoriser_id|body|string|true|The Contact bank account that will be used to pay the PR (`Contact.data.bank_account.id`)'|
|» metadata|body|[Metadata](#schemametadata)|false|Use for your custom data an certain Split customisations|


> Example responses


```json
{
  "data": {
    "ref": "PR.3",
    "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
    "authoriser_id": "de86472c-c027-4735-a6a7-234366a27fc7",
    "status": "pending_approval",
    "responded_at": null,
    "created_at": "2016-12-19T02:10:56Z",
    "credit_ref": null,
    "payout": {
      "amount": 99000,
      "description": "The elite package for 4",
      "matures_at": "2016-12-25T00:00:00Z"
    },
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


<h3 id="Request Payment-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Created|[MakeAPaymentRequestResponse](#schemamakeapaymentrequestresponse)|


## Approve a Payment Request


<a id="opIdApprovePaymentRequest"></a>


> Code samples


```shell
curl -X POST https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/approve \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
POST https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/approve HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/approve',
  method: 'post'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/approve',
{
  method: 'POST',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.post 'https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/approve', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.post('https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/approve', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/approve");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`POST /payment_requests/{payment_request_ref}/approve`


<h3 id="Approve-a-Payment-Request-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|payment_request_ref|path|string|true|Single value, exact match|


> Example responses


```json
{
  "data": {
    "ref": "PR.3",
    "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
    "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
    "status": "approved",
    "responded_at": "2016-12-19T02:38:04Z",
    "created_at": "2016-12-19T02:10:56Z",
    "debit_ref": "D.b",
    "payout": {
      "amount": 99000,
      "description": "The elite package for 4",
      "matures_at": "2016-12-25T00:00:00Z"
    },
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


<h3 id="Approve a Payment Request-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ApprovePaymentRequestResponse](#schemaapprovepaymentrequestresponse)|


## Decline a Payment Request


<a id="opIdDeclinePaymentRequest"></a>


> Code samples


```shell
curl -X POST https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/decline \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
POST https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/decline HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/decline',
  method: 'post'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/decline',
{
  method: 'POST',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.post 'https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/decline', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.post('https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/decline', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/decline");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`POST /payment_requests/{payment_request_ref}/decline`


<h3 id="Decline-a-Payment-Request-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|payment_request_ref|path|string|true|Single value, exact match|


> Example responses


```json
{
  "data": {
    "ref": "PR.3",
    "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
    "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
    "status": "declined",
    "responded_at": "2016-12-19T02:38:04Z",
    "created_at": "2016-12-19T02:10:56Z",
    "debit_ref": null,
    "payout": {
      "amount": 99000,
      "description": "The elite package for 4",
      "matures_at": "2016-12-25T00:00:00Z"
    },
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


<h3 id="Decline a Payment Request-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|No description|[DeclinePaymentRequestResponse](#schemadeclinepaymentrequestresponse)|


## Get a Payment Request


<a id="opIdGetAPaymentRequest"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/payment_requests/{payment_request_ref} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/payment_requests/{payment_request_ref} HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/payment_requests/{payment_request_ref}',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/payment_requests/{payment_request_ref}',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/payment_requests/{payment_request_ref}', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/payment_requests/{payment_request_ref}', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/payment_requests/{payment_request_ref}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /payment_requests/{payment_request_ref}`


<h3 id="Get-a-Payment-Request-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|payment_request_ref|path|string|true|Single value, exact match|


> Example responses


```json
{
  "data": {
    "ref": "PR.3",
    "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
    "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
    "status": "approved",
    "responded_at": "2016-12-19T02:38:04Z",
    "created_at": "2016-12-19T02:10:56Z",
    "credit_ref": "C.b",
    "payout": {
      "amount": 99000,
      "description": "The elite package for 4",
      "matures_at": "2016-12-25T00:00:00Z"
    },
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


<h3 id="Get a Payment Request-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[GetAPaymentRequestResponse](#schemagetapaymentrequestresponse)|


## Cancel a Payment Request


<a id="opIdCancelAPaymentRequest"></a>


> Code samples


```shell
curl -X DELETE https://api-sandbox.split.cash/payment_requests/{payment_request_ref} \
  -H 'Authorization: Bearer {access_token}'


```


```http
DELETE https://api-sandbox.split.cash/payment_requests/{payment_request_ref} HTTP/1.1
Host: api-sandbox.split.cash


```


```javascript
var headers = {
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/payment_requests/{payment_request_ref}',
  method: 'delete'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/payment_requests/{payment_request_ref}',
{
  method: 'DELETE',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.delete 'https://api-sandbox.split.cash/payment_requests/{payment_request_ref}', headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Authorization': 'Bearer {access_token}'
}


r = requests.delete('https://api-sandbox.split.cash/payment_requests/{payment_request_ref}', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/payment_requests/{payment_request_ref}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("DELETE");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`DELETE /payment_requests/{payment_request_ref}`


A PR can only be cancelled if it has not yet matured.


<h3 id="Cancel-a-Payment-Request-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|payment_request_ref|path|string|true|Single value, exact match|


<h3 id="Cancel a Payment Request-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|No Content|None|


## List incoming Payment Requests


<a id="opIdListIncomingPaymentRequests"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/payment_requests/incoming \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/payment_requests/incoming HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/payment_requests/incoming',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/payment_requests/incoming',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/payment_requests/incoming', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/payment_requests/incoming', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/payment_requests/incoming");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /payment_requests/incoming`


<h3 id="List-incoming-Payment-Requests-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|string|false|Page of results to return, single value, exact match|
|per_page|query|string|false|Number of results per page, single value, exact match|


> Example responses


```json
{
  "data": [
    {
      "ref": "PR.2",
      "initiator_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
      "authoriser_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
      "status": "approved",
      "responded_at": "2016-12-19T02:10:18Z",
      "created_at": "2016-12-19T02:09:09Z",
      "debit_ref": "D.a",
      "payout": {
        "amount": 30000,
        "description": "The SuperPackage",
        "matures_at": "2016-12-20T00:00:00Z"
      }
    },
    {
      "ref": "PR.3",
      "initiator_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
      "authoriser_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
      "status": "pending_approval",
      "responded_at": null,
      "created_at": "2016-12-19T02:10:56Z",
      "debit_ref": null,
      "payout": {
        "amount": 99000,
        "description": "The elite package for 4",
        "matures_at": "2016-12-25T00:00:00Z"
      },
      "metadata": {
        "custom_key": "Custom string",
        "another_custom_key": "Maybe a URL"
      }
    }
  ]
}
```


<h3 id="List incoming Payment Requests-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ListIncomingPaymentRequestsResponse](#schemalistincomingpaymentrequestsresponse)|


## List outgoing Payment Requests


<a id="opIdListOutgoingPaymentRequests"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/payment_requests/outgoing \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/payment_requests/outgoing HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/payment_requests/outgoing',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/payment_requests/outgoing',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/payment_requests/outgoing', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/payment_requests/outgoing', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/payment_requests/outgoing");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /payment_requests/outgoing`


<h3 id="List-outgoing-Payment-Requests-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|string|false|Page of results to return, single value, exact match|
|per_page|query|string|false|Number of results per page, single value, exact match|


> Example responses


```json
{
  "data": [
    {
      "ref": "PR.4",
      "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
      "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
      "status": "approved",
      "responded_at": "2016-12-19T02:10:18Z",
      "created_at": "2016-12-19T02:09:09Z",
      "credit_ref": "C.a",
      "payout": {
        "amount": 30000,
        "description": "The SuperPackage",
        "matures_at": "2016-12-20T00:00:00Z"
      }
    },
    {
      "ref": "PR.5",
      "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
      "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
      "status": "pending_approval",
      "responded_at": null,
      "created_at": "2016-12-19T02:10:56Z",
      "credit_ref": null,
      "payout": {
        "amount": 99000,
        "description": "The elite package for 4",
        "matures_at": "2016-12-25T00:00:00Z"
      }
    }
  ]
}
```


<h3 id="List outgoing Payment Requests-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ListOutgoingPaymentRequestsResponse](#schemalistoutgoingpaymentrequestsresponse)|


## Get a Payment Request's history


<a id="opIdGetAPaymentRequest'sHistory"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/history \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/history HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/history',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/history',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/history', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/history', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/payment_requests/{payment_request_ref}/history");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /payment_requests/{payment_request_ref}/history`


Gives you visibility of the entire Payment Request lifecycle including the generated debit and credit transactions.


<h3 id="Get-a-Payment-Request's-history-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|payment_request_ref|path|string|true|Single value, exact match|


> Example responses


```json
{
  "data": [
    {
      "type": "payout_request",
      "event": "requested",
      "at": "2017-01-05T07:47:45Z",
      "ref": "PR.3",
      "by": "Fancy Pants (fancy_pants)"
    },
    {
      "type": "payout_request",
      "event": "approved",
      "at": "2017-01-07T06:13:52Z",
      "ref": "PR.3",
      "by": "Lycra Co (lycra_co)"
    },
    {
      "type": "debit",
      "event": "scheduled",
      "at": "2017-01-07T06:13:52Z",
      "ref": "D.n",
      "by": "Split Payments"
    },
    {
      "type": "credit",
      "event": "scheduled",
      "at": "2017-01-07T06:13:52Z",
      "ref": "C.e",
      "by": "Split Payments"
    },
    {
      "type": "debit",
      "event": "matured",
      "at": "2017-01-08T04:30:14Z",
      "ref": "D.n",
      "by": "Split Payments"
    },
    {
      "type": "debit",
      "event": "processing",
      "at": "2017-01-08T04:30:14Z",
      "ref": "D.n",
      "by": "Split Payments"
    },
    {
      "type": "debit",
      "event": "clearing",
      "at": "2017-01-08T19:02:20Z",
      "ref": "D.n",
      "by": "Split Payments"
    },
    {
      "type": "debit",
      "event": "cleared",
      "at": "2017-01-11T19:07:52Z",
      "ref": "D.n",
      "by": "Split Payments"
    },
    {
      "type": "credit",
      "event": "matured",
      "at": "2017-01-11T19:07:52Z",
      "ref": "C.e",
      "by": "Split Payments"
    },
    {
      "type": "credit",
      "event": "processing",
      "at": "2017-01-12T04:30:25Z",
      "ref": "C.e",
      "by": "Split Payments"
    },
    {
      "type": "credit",
      "event": "clearing",
      "at": "2017-01-12T05:17:32Z",
      "ref": "C.e",
      "by": "Split Payments"
    },
    {
      "type": "credit",
      "event": "cleared",
      "at": "2017-01-15T05:27:12Z",
      "ref": "C.e",
      "by": "Split Payments"
    }
  ]
}
```


<h3 id="Get a Payment Request's history-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[GetAPaymentRequestsHistoryResponse](#schemagetapaymentrequestshistoryresponse)|


<h1 id="Split-API-Refunds">Refunds</h1>


Refunds can be issued for any successfully cleared Payout (credit) transactions.


<div class="middle-header">Direction</div>


Refunds are broken up by direction:


1. **Incoming:** An incoming Refund (you are the recipient of the refund)
2. **Outgoing:** An outgoing Refund (you are the issuer of the refund)


There are two response fields that differ depending on the direction:


| Field | Description |
|-------|-------------|
| `debit_ref` | Only visible to the Refund issuer (outgoing Refunds). This reference corresponds to the newly created debit to process the Refund. |
| `credit_ref` | Only visible to the Refund recipient (incoming Refunds). This reference corresponds to the newly created credit to process the Refund. |


## Issue a Refund


<a id="opIdIssueARefund"></a>


> Code samples


```shell
curl -X POST https://api-sandbox.split.cash/credits/{credit_ref}/refunds \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}' \
  -d '{
  "amount": 500,
  "reason": "Because reason",
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}'


```


```http
POST https://api-sandbox.split.cash/credits/{credit_ref}/refunds HTTP/1.1
Host: api-sandbox.split.cash
Content-Type: application/json
Accept: application/json


```


```javascript
var headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


var body = '{
  "amount": 500,
  "reason": "Because reason",
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}';


$.ajax({
  url: 'https://api-sandbox.split.cash/credits/{credit_ref}/refunds',
  method: 'post',
  data: body,
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');
const inputBody = '{
  "amount": 500,
  "reason": "Because reason",
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}';
const headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/credits/{credit_ref}/refunds',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


params = '{
  "amount": 500,
  "reason": "Because reason",
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}'


result = RestClient.post 'https://api-sandbox.split.cash/credits/{credit_ref}/refunds', params, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.post('https://api-sandbox.split.cash/credits/{credit_ref}/refunds', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/credits/{credit_ref}/refunds");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`POST /credits/{credit_ref}/refunds`


Certain rules apply to the issuance of a refund:


* Must be applied against a successfully cleared payout (credit)
* The refund amount may not exceed the original amount of the credit


> Body parameter


```json
{
  "amount": 500,
  "reason": "Because reason",
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}
```


<h3 id="Issue-a-Refund-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|credit_ref|path|string|true|No description|
|body|body|[IssueARefundRequest](#schemaissuearefundrequest)|true|No description|
|» amount|body|number|true|Amount in cents refund|
|» reason|body|string|false|Reason for the refund. Visible to both parties.|
|» metadata|body|[Metadata](#schemametadata)|false|Use for your custom data an certain Split customisations|


> Example responses


```json
{
  "data": {
    "ref": "PRF.1",
    "for_ref": "C.59",
    "debit_ref": "D.hi",
    "created_at": "2017-05-08T07:20:24Z",
    "amount": 500,
    "reason": "Because reason",
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


<h3 id="Issue a Refund-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Created|[IssueARefundResponse](#schemaissuearefundresponse)|


## List incoming Refunds


<a id="opIdListIncomingRefunds|Get"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/refunds/incoming \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/refunds/incoming HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/refunds/incoming',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/refunds/incoming',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/refunds/incoming', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/refunds/incoming', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/refunds/incoming");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /refunds/incoming`


<h3 id="List-incoming-Refunds-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|string|false|Page of results to return, single value, exact match|
|per_page|query|string|false|Number of results per page, single value, exact match|


> Example responses


```json
{
  "data": [
    {
      "ref": "PRF.2",
      "for_ref": "D.5",
      "credit_ref": "C.q",
      "created_at": "2017-05-09T04:45:26Z",
      "amount": 5,
      "reason": "Because reason",
      "metadata": {
        "custom_key": "Custom string",
        "another_custom_key": "Maybe a URL"
      }
    }
  ]
}
```


<h3 id="List incoming Refunds-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ListIncomingRefundsResponse](#schemalistincomingrefundsresponse)|


## List outgoing Refunds


<a id="opIdListOutgoingRefunds"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/refunds/outgoing \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/refunds/outgoing HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/refunds/outgoing',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/refunds/outgoing',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/refunds/outgoing', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/refunds/outgoing', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/refunds/outgoing");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /refunds/outgoing`


<h3 id="List-outgoing-Refunds-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|string|false|Page of results to return, single value, exact match|
|per_page|query|string|false|Number of results per page, single value, exact match|


> Example responses


```json
{
  "data": [
    {
      "ref": "PRF.2",
      "for_ref": "C.5",
      "debit_ref": "D.5a",
      "created_at": "2017-05-09T04:45:26Z",
      "amount": 5,
      "reason": "Because reason",
      "metadata": {
        "custom_key": "Custom string",
        "another_custom_key": "Maybe a URL"
      }
    }
  ]
}
```


<h3 id="List outgoing Refunds-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ListOutgoingRefundsResponse](#schemalistoutgoingrefundsresponse)|


## Retrieve a Refund


<a id="opIdRetrieveARefund"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/refunds/{refund_ref} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/refunds/{refund_ref} HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/refunds/{refund_ref}',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/refunds/{refund_ref}',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/refunds/{refund_ref}', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/refunds/{refund_ref}', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/refunds/{refund_ref}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /refunds/{refund_ref}`


Get a single Refund by its reference


<h3 id="Retrieve-a-Refund-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|refund_ref|path|string|true|Single value, exact match|


> Example responses


```json
{
  "data": {
    "ref": "PRF.1",
    "for_ref": "C.59",
    "debit_ref": "D.hi",
    "created_at": "2017-05-08T07:20:24Z",
    "amount": 500,
    "reason": "Because reason",
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


<h3 id="Retrieve a Refund-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RetrieveARefundResponse](#schemaretrievearefundresponse)|


<h1 id="Split-API-Refund-Requests">Refund Requests</h1>


Manage Refund Requests (RR) applied against successfully cleared Payouts.
A refunder corresponds to a recipient of a successfully cleared Payout (credit).


<div class="middle-header">Direction</div>


Refund Requests are broken up by direction:


1. **Incoming:** An incoming Refund Request (you are the authoriser/refunder)
2. **Outgoing:** An outgoing Refund Request (you are the initiator/refundee)


There are two response fields that differ depending on the direction:


| Field | Description |
|-------|-------------|
| `debit_ref` | Only visible to the RR authoriser (incoming RRs). This reference corresponds to the newly created debit to process the approved RR. |
| `credit_ref` | Only visible to the RR initiator (outgoing RRs). This reference corresponds to the newly created credit from the approved RR. |


##Lifecycle


A Refund Request can have the following statuses:


| Status | Description |
|-------|-------------|
| `pending_approval` | Waiting for the authoriser to approve the RR. |
| `approved` | The authoriser has approved the RR. |
| `declined` | The payer has declined the RR. |
| `cancelled` | The initiator has cancelled the RR. |


## Request a Refund


<a id="opIdRequestARefund"></a>


> Code samples


```shell
curl -X POST https://api-sandbox.split.cash/payout_refund_requests \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}' \
  -d '{
  "for_ref": "D.1",
  "amount": 500,
  "reason": "Because reason",
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}'


```


```http
POST https://api-sandbox.split.cash/payout_refund_requests HTTP/1.1
Host: api-sandbox.split.cash
Content-Type: application/json
Accept: application/json


```


```javascript
var headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


var body = '{
  "for_ref": "D.1",
  "amount": 500,
  "reason": "Because reason",
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}';


$.ajax({
  url: 'https://api-sandbox.split.cash/payout_refund_requests',
  method: 'post',
  data: body,
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');
const inputBody = '{
  "for_ref": "D.1",
  "amount": 500,
  "reason": "Because reason",
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}';
const headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/payout_refund_requests',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


params = '{
  "for_ref": "D.1",
  "amount": 500,
  "reason": "Because reason",
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}'


result = RestClient.post 'https://api-sandbox.split.cash/payout_refund_requests', params, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.post('https://api-sandbox.split.cash/payout_refund_requests', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/payout_refund_requests");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`POST /payout_refund_requests`


Certain rules apply to the creation of a Refund Request:


* Must be applied against a successfully cleared payout (debit)
* The refund amount requested from a Payout recipient may not exceed the original amount of the Payout


> Body parameter


```json
{
  "for_ref": "D.1",
  "amount": 500,
  "reason": "Because reason",
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}
```


<h3 id="Request-a-Refund-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[RequestARefundRequest](#schemarequestarefundrequest)|true|No description|
|» for_ref|body|string|true|The Payout debit reference to refund against|
|» amount|body|number|true|Amount in cents to request from the original payout recipient|
|» reason|body|string|false|Reason for the refund request. Visible to both parties.|
|» metadata|body|[Metadata](#schemametadata)|false|Use for your custom data an certain Split customisations|


> Example responses


```json
{
  "data": {
    "ref": "RR.2",
    "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
    "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
    "status": "pending_approval",
    "responded_at": null,
    "created_at": "2016-12-19T04:34:38Z",
    "for_ref": "D.1",
    "credit_ref": null,
    "amount": 500,
    "reason": "Because reasons",
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


<h3 id="Request a Refund-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Created|[RequestARefundResponse](#schemarequestarefundresponse)|


## Approve Refund Request


<a id="opIdApproveRefundRequest"></a>


> Code samples


```shell
curl -X POST https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}/approve \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
POST https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}/approve HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}/approve',
  method: 'post'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}/approve',
{
  method: 'POST',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.post 'https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}/approve', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.post('https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}/approve', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}/approve");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`POST /payout_refund_requests/{payout_refund_request_ref}/approve`


<h3 id="Approve-Refund-Request-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|payout_refund_request_ref|path|string|true|Single value, exact match|


> Example responses


```json
{
  "data": {
    "ref": "RR.2",
    "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
    "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
    "status": "approved",
    "responded_at": "2016-12-19T04:42:59Z",
    "created_at": "2016-12-19T04:34:38Z",
    "for_ref": "C.1",
    "debit_ref": "D.2c3",
    "amount": 100,
    "reason": "Because reasons",
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


<h3 id="Approve Refund Request-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ApprovePayoutRefundRequestResponse](#schemaapprovepayoutrefundrequestresponse)|


## Decline Refund Request


<a id="opIdDeclineRefundRequest"></a>


> Code samples


```shell
curl -X POST https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}/decline \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
POST https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}/decline HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}/decline',
  method: 'post'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}/decline',
{
  method: 'POST',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.post 'https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}/decline', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.post('https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}/decline', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}/decline");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`POST /payout_refund_requests/{payout_refund_request_ref}/decline`


<h3 id="Decline-Refund-Request-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|payout_refund_request_ref|path|string|true|Single value, exact match|


> Example responses


```json
{
  "data": {
    "ref": "RR.2",
    "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
    "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
    "status": "declined",
    "responded_at": "2016-12-19T04:42:59Z",
    "created_at": "2016-12-19T04:34:38Z",
    "for_ref": "D.1",
    "debit_ref": null,
    "amount": 100,
    "reason": "Because reasons",
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


<h3 id="Decline Refund Request-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[DeclinePayoutRefundRequestResponse](#schemadeclinepayoutrefundrequestresponse)|


## Retrieve a Refund Request


<a id="opIdRetrieveARefundRequest"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref} HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /payout_refund_requests/{payout_refund_request_ref}`


Get a specific Refund Request by its reference


<h3 id="Retrieve-a-Refund-Request-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|payout_refund_request_ref|path|string|true|Single value, exact match|


> Example responses


```json
{
  "data": {
    "ref": "RR.2",
    "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
    "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
    "status": "pending_approval",
    "responded_at": null,
    "created_at": "2016-12-19T04:34:38Z",
    "for_ref": "D.1",
    "credit_ref": null,
    "amount": 10000,
    "reason": "Because reasons",
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


<h3 id="Retrieve a Refund Request-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[RetrieveARefundRequestResponse](#schemaretrievearefundrequestresponse)|


## Cancel a Refund Request


<a id="opIdCancelARefundRequest"></a>


> Code samples


```shell
curl -X DELETE https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref} \
  -H 'Authorization: Bearer {access_token}'


```


```http
DELETE https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref} HTTP/1.1
Host: api-sandbox.split.cash


```


```javascript
var headers = {
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}',
  method: 'delete'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}',
{
  method: 'DELETE',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.delete 'https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}', headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Authorization': 'Bearer {access_token}'
}


r = requests.delete('https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/payout_refund_requests/{payout_refund_request_ref}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("DELETE");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`DELETE /payout_refund_requests/{payout_refund_request_ref}`


A Refund Request can only be canceled if it is pending approval.


<h3 id="Cancel-a-Refund-Request-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|payout_refund_request_ref|path|string|true|Single value, exact match|


<h3 id="Cancel a Refund Request-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|No Content|None|


## List incoming Refund Requests


<a id="opIdListIncomingRefundRequests"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/payout_refund_requests/incoming \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/payout_refund_requests/incoming HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/payout_refund_requests/incoming',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/payout_refund_requests/incoming',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/payout_refund_requests/incoming', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/payout_refund_requests/incoming', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/payout_refund_requests/incoming");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /payout_refund_requests/incoming`


<h3 id="List-incoming-Refund-Requests-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|string|false|Page of results to return, single value, exact match|
|per_page|query|string|false|Number of results per page, single value, exact match|


> Example responses


```json
{
  "data": [
    {
      "ref": "RR.2",
      "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
      "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
      "status": "approved",
      "responded_at": "2016-12-19T04:42:59Z",
      "created_at": "2016-12-19T04:34:38Z",
      "for_ref": "C.1",
      "debit_ref": "D.2c3",
      "amount": 100,
      "reason": "Because reasons",
      "metadata": {
        "custom_key": "Custom string",
        "another_custom_key": "Maybe a URL"
      }
    }
  ]
}
```


<h3 id="List incoming Refund Requests-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ListIncomingRefundRequestsResponse](#schemalistincomingrefundrequestsresponse)|


## List outgoing Refund Requests


<a id="opIdListOutgoingRefundRequests"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/payout_refund_requests/outgoing \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/payout_refund_requests/outgoing HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/payout_refund_requests/outgoing',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/payout_refund_requests/outgoing',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/payout_refund_requests/outgoing', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/payout_refund_requests/outgoing', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/payout_refund_requests/outgoing");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /payout_refund_requests/outgoing`


<h3 id="List-outgoing-Refund-Requests-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|string|false|Page of results to return, single value, exact match|
|per_page|query|string|false|Number of results per page, single value, exact match|


> Example responses


```json
{
  "data": [
    {
      "ref": "RR.2",
      "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
      "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
      "status": "pending_approval",
      "responded_at": null,
      "created_at": "2016-12-19T04:34:38Z",
      "for_ref": "D.1",
      "credit_ref": null,
      "amount": 10000,
      "reason": "Because reasons",
      "metadata": {
        "custom_key": "Custom string",
        "another_custom_key": "Maybe a URL"
      }
    }
  ]
}
```


<h3 id="List outgoing Refund Requests-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ListOutgoingRefundRequestsResponse](#schemalistoutgoingrefundrequestsresponse)|


<h1 id="Split-API-Transactions">Transactions</h1>


The transactions endpoint provides a detailed look at all past, current and future scheduled debits & credits relating to the Split account. In other words, we not only show the transactions initiated by the Split account but also show transactions where the Split account is on the receiving end - even for payments that have not yet matured.


##Lifecycle


A transaction (debit or credit) can have the following statuses:


| Status | Description |
|--------|-------------|
| `maturing` | The maturation date has not yet been reached |
| `matured` | The maturation date has been reached and the transaction is eligible for processing. |
| `processing` | The transaction has been submitted to the bank. |
| `clearing` | Waiting for confirmation from the bank that the transaction has succeeded. |
| `cleared` | The transaction is complete. |
| `rejected` | The bank has rejected the transaction due to incorrect bank account details. |
| `returned` | The transaction did not successfully clear. |
| `voided` | The transaction has been cancelled and is no longer eligible for processing. |
| `pending_verification` | The bank account must be verified before the transaction can proceed. |
| `paused` | The transaction has temporary been paused by Split pending internal review. |
| `prefailed` | The transaction was never submitted to the bank because we detected that there were insufficient funds. The transaction can be retried. |


##Failure reasons


> Example response


```json
{
  "data": [
    {
      "ref": "D.3",
      "parent_ref": null,
      "type": "debit",
      "category": "payout_refund",
      "created_at": "2016-12-07T23:15:00Z",
      "matures_at": "2016-12-10T23:15:00Z",
      "cleared_at": null,
      "bank_ref": null,
      "status": "returned",
      "failure_reason": "refer_to_customer"
      "party_name": "Sanford-Rees",
      "party_nickname": "sanford-rees-8",
      "description": null,
      "amount": 1
    }
  ]
}
```


The `rejected`, `returned`, `voided` & `prefailed` statuses are always accompanied by a `failure_reason`:


| Reason | Description |
|--------|-------------|
| `invalid_bsb_number` | BSB number is invalid |
| `payment_stopped` | The payment was stopped at the bank. Can be due to a customer requesting a stop payment with their financial institution. |
| `account_closed` | The bank account is closed |
| `customer_deceased` | Customer is deceased |
| `incorrect_account_number` | Account number is incorrect |
| `refer_to_customer` | Usually due to insufficient funds |
| `refer_to_split` | Failed due to reasons not listed here. Please contact us. |
| `insufficient_funds` | Insufficient funds |


## List all transactions


<a id="opIdListAllTransactions"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/transactions \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/transactions HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/transactions',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/transactions',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/transactions', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/transactions', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/transactions");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /transactions`


<h3 id="List-all-transactions-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|string|false|Page of results to return, single value, exact match|
|per_page|query|string|false|Number of results per page, single value, exact match|
|ref|query|string|false|Single value, exact match|
|parent_ref|query|string|false|Single value, exact match|
|bank_ref|query|string|false|Single value, exact match|
|status|query|array[string]|false|Multiple values, exact match|
|category|query|array[string]|false|Multiple values, exact match|
|type|query|array[string]|false|Multiple values, exact match|
|other_party|query|string|false|Single value, string search|
|description|query|string|false|Single value, string search|
|min_amount|query|integer|false|Cents, Single value, exact match|
|max_amount|query|integer|false|Cents, single value, exact match|
|min_created_date|query|string(date-time)|false|Date/time UTC ISO 8601 format, Single value, exact match|
|max_created_date|query|string(date-time)|false|Date/time UTC ISO 8601 format, single value, exact match|
|min_matured_date|query|string(date-time)|false|Date/time UTC ISO 8601 format, Single value, exact match|
|max_matured_date|query|string(date-time)|false|Date/time UTC ISO 8601 format, single value, exact match|
|min_cleared_date|query|string(date-time)|false|Date/time UTC ISO 8601 format, Single value, exact match|
|max_cleared_date|query|string(date-time)|false|Date/time UTC ISO 8601 format, single value, exact match|


#### Enumerated Values


|Parameter|Value|
|---|---|
|status|maturing|
|status|matured|
|status|processing|
|status|clearing|
|status|cleared|
|status|rejected|
|status|returned|
|status|voided|
|status|pending_verification|
|status|paused|
|category|payout|
|category|payout_refund|
|category|invoice|
|type|debit|
|type|credit|


> Example responses


```json
{
  "data": [
    {
      "ref": "D.3",
      "parent_ref": null,
      "type": "debit",
      "category": "payout_refund",
      "created_at": "2016-12-07T23:15:00Z",
      "matures_at": "2016-12-10T23:15:00Z",
      "cleared_at": null,
      "bank_ref": null,
      "status": "Pending",
      "party_name": "Sanford-Rees",
      "party_nickname": "sanford-rees-8",
      "description": null,
      "amount": 1
    },
    {
      "ref": "D.2",
      "parent_ref": "PB.2",
      "type": "debit",
      "category": "payout",
      "created_at": "2016-12-06T23:15:00Z",
      "matures_at": "2016-12-09T23:15:00Z",
      "cleared_at": null,
      "bank_ref": null,
      "status": " Pending",
      "party_name": "Gutmann-Schmidt",
      "party_nickname": "gutmann-schmidt-6",
      "description": null,
      "amount": 1
    },
    {
      "ref": "C.2",
      "parent_ref": null,
      "type": "credit",
      "category": "payout",
      "created_at": "2016-12-05T23:15:00Z",
      "matures_at": "2016-12-06T23:15:00Z",
      "cleared_at": "2016-12-09T23:15:00Z",
      "bank_ref": "CT.1",
      "status": "Pending",
      "party_name": "Price and Sons",
      "party_nickname": "price-and-sons-2",
      "description": "Money for jam",
      "amount": 1
    }
  ]
}
```


<h3 id="List all transactions-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ListAllTransactionsResponse](#schemalistalltransactionsresponse)|


<h1 id="Split-API-Unassigned-Agreements">Unassigned Agreements</h1>


An agreement with no preset authoriser that can only be accepted once and must be accepted within a predefined time period.


Unassigned Agreements are shared using the generated link available in the response body. You can then include it in an email, text message, embed it in an iFrame, etc...


## Propose an Unassigned Agreement


<a id="opIdProposeUnassignedAgreement"></a>


> Code samples


```shell
curl -X POST https://api-sandbox.split.cash/unassigned_agreements \
  -H 'Content-Type: application/json' \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}' \
  -d '{
  "expiry_in_seconds": 60,
  "terms": {
    "per_payout": {
      "min_amount": null,
      "max_amount": 10000
    },
    "per_frequency": {
      "days": 7,
      "max_amount": 1000000
    }
  }
}'


```


```http
POST https://api-sandbox.split.cash/unassigned_agreements HTTP/1.1
Host: api-sandbox.split.cash
Content-Type: application/json
Accept: application/json


```


```javascript
var headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


var body = '{
  "expiry_in_seconds": 60,
  "terms": {
    "per_payout": {
      "min_amount": null,
      "max_amount": 10000
    },
    "per_frequency": {
      "days": 7,
      "max_amount": 1000000
    }
  }
}';


$.ajax({
  url: 'https://api-sandbox.split.cash/unassigned_agreements',
  method: 'post',
  data: body,
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');
const inputBody = '{
  "expiry_in_seconds": 60,
  "terms": {
    "per_payout": {
      "min_amount": null,
      "max_amount": 10000
    },
    "per_frequency": {
      "days": 7,
      "max_amount": 1000000
    }
  }
}';
const headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/unassigned_agreements',
{
  method: 'POST',
  body: inputBody,
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


params = '{
  "expiry_in_seconds": 60,
  "terms": {
    "per_payout": {
      "min_amount": null,
      "max_amount": 10000
    },
    "per_frequency": {
      "days": 7,
      "max_amount": 1000000
    }
  }
}'


result = RestClient.post 'https://api-sandbox.split.cash/unassigned_agreements', params, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.post('https://api-sandbox.split.cash/unassigned_agreements', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/unassigned_agreements");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("POST");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`POST /unassigned_agreements`


Create an Unassigned Agreement


<aside class="notice">You can set any of the term metrics to <code>null</code> if you wish them to not have a limit.</aside>


> Body parameter


```json
{
  "expiry_in_seconds": 60,
  "terms": {
    "per_payout": {
      "min_amount": null,
      "max_amount": 10000
    },
    "per_frequency": {
      "days": 7,
      "max_amount": 1000000
    }
  }
}
```


<h3 id="Propose-an-Unassigned-Agreement-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|body|body|[ProposeUnassignedAgreementRequest](#schemaproposeunassignedagreementrequest)|true|No description|
|» expiry_in_seconds|body|number|true|The amount of time in seconds before the Unassigned Agreement can no longer be accepted.|
|» terms|body|[Terms](#schematerms)|true|Terms|
|»» per_payout|body|[PerPayout](#schemaperpayout)|true|No description|
|»»» min_amount|body|number|false|Minimum amount in cents a PR can be in order to be auto-approved|
|»»» max_amount|body|number|false|Maximum amount in cents a PR can be in order to be auto-approved|
|»» per_frequency|body|[PerFrequency](#schemaperfrequency)|true|No description|
|»»» days|body|number|false|Amount of days to apply against the frequency|
|»»» max_amount|body|number|false|Maximum amount in cents the total of all PRs can be for the duration of the frequency|


> Example responses


```json
{
  "data": {
    "ref": "A.4k",
    "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
    "status": "proposed",
    "responded_at": null,
    "created_at": "2017-03-20T00:53:27Z",
    "terms": {
      "per_payout": {
        "max_amount": 10000,
        "min_amount": null
      },
      "per_frequency": {
        "days": 7,
        "max_amount": 1000000
      }
    },
    "assignment_expires_at": "2017-03-20T00:54:27Z",
    "link": "https://go-sandbox.split.cash/unassigned_agreements/b61fc159-8779-4a17-a826-e398e3e7e211/invitation"
  }
}
```


<h3 id="Propose an Unassigned Agreement-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|201|[Created](https://tools.ietf.org/html/rfc7231#section-6.3.2)|Created|[ProposeUnassignedAgreementResponse](#schemaproposeunassignedagreementresponse)|


## List all Unassigned Agreements


<a id="opIdGetUnassignedAgreements"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/unassigned_agreements \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/unassigned_agreements HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/unassigned_agreements',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/unassigned_agreements',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/unassigned_agreements', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/unassigned_agreements', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/unassigned_agreements");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /unassigned_agreements`


Will return all Unassigned Agreements that have not yet be accepted.


<h3 id="List-all-Unassigned-Agreements-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|page|query|string|false|Page of results to return, single value, exact match|
|per_page|query|string|false|Number of results per page, single value, exact match|


> Example responses


```json
{
  "data": [
    {
      "ref": "A.4k",
      "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
      "status": "proposed",
      "responded_at": null,
      "created_at": "2017-03-20T00:53:27Z",
      "terms": {
        "per_payout": {
          "max_amount": 10000,
          "min_amount": null
        },
        "per_frequency": {
          "days": 7,
          "max_amount": 1000000
        }
      },
      "assignment_expires_at": "2017-03-20T00:54:27Z",
      "link": "https://go-sandbox.split.cash/unassigned_agreements/b61fc159-8779-4a17-a826-e398e3e7e211/invitation"
    },
    {
      "ref": "A.7ea",
      "initiator_id": "b61fc159-8779-4a17-a826-e398e3e7e211",
      "status": "proposed",
      "responded_at": null,
      "created_at": "2017-03-21T00:53:27Z",
      "terms": {
        "per_payout": {
          "max_amount": null,
          "min_amount": null
        },
        "per_frequency": {
          "days": null,
          "max_amount": null
        }
      },
      "assignment_expires_at": "2017-03-21T00:54:27Z",
      "link": "https://go-sandbox.split.cash/unassigned_agreements/4e2728cc-b4ba-42c2-a6c3-26a7758de58d/invitation"
    }
  ]
}
```


<h3 id="List all Unassigned Agreements-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[ListUnassignedAgreementsResponse](#schemalistunassignedagreementsresponse)|


## Get an Unassigned Agreement


<a id="opIdGetAgreement"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/unassigned_agreements/{unassigned_agreement_ref} \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/unassigned_agreements/{unassigned_agreement_ref} HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/unassigned_agreements/{unassigned_agreement_ref}',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/unassigned_agreements/{unassigned_agreement_ref}',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/unassigned_agreements/{unassigned_agreement_ref}', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/unassigned_agreements/{unassigned_agreement_ref}', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/unassigned_agreements/{unassigned_agreement_ref}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /unassigned_agreements/{unassigned_agreement_ref}`


Get a single Unassigned Agreement by its reference


<h3 id="Get-an-Unassigned-Agreement-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|unassigned_agreement_ref|path|string|true|Single value, exact match|


> Example responses


```json
{
  "data": {
    "ref": "A.4k",
    "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
    "status": "proposed",
    "responded_at": null,
    "created_at": "2017-03-20T00:53:27Z",
    "terms": {
      "per_payout": {
        "max_amount": 10000,
        "min_amount": null
      },
      "per_frequency": {
        "days": 7,
        "max_amount": 1000000
      }
    },
    "assignment_expires_at": "2017-03-20T00:54:27Z",
    "link": "https://go-sandbox.split.cash/unassigned_agreements/b61fc159-8779-4a17-a826-e398e3e7e211/invitation"
  }
}
```


<h3 id="Get an Unassigned Agreement-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[GetUnassignedAgreementResponse](#schemagetunassignedagreementresponse)|


## Delete an Unassigned Agreement


<a id="opIdDeleteUnassignedAgreement"></a>


> Code samples


```shell
curl -X DELETE https://api-sandbox.split.cash/unassigned_agreements/{unassigned_agreement_ref} \
  -H 'Authorization: Bearer {access_token}'


```


```http
DELETE https://api-sandbox.split.cash/unassigned_agreements/{unassigned_agreement_ref} HTTP/1.1
Host: api-sandbox.split.cash


```


```javascript
var headers = {
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/unassigned_agreements/{unassigned_agreement_ref}',
  method: 'delete'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/unassigned_agreements/{unassigned_agreement_ref}',
{
  method: 'DELETE',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.delete 'https://api-sandbox.split.cash/unassigned_agreements/{unassigned_agreement_ref}', headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Authorization': 'Bearer {access_token}'
}


r = requests.delete('https://api-sandbox.split.cash/unassigned_agreements/{unassigned_agreement_ref}', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/unassigned_agreements/{unassigned_agreement_ref}");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("DELETE");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`DELETE /unassigned_agreements/{unassigned_agreement_ref}`


An Unassigned Agreement can be deleted at anytime as long as it has not yet been assigned an authoriser.


<h3 id="Delete-an-Unassigned-Agreement-parameters" class="parameters">Parameters</h3>


|Parameter|In|Type|Required|Description|
|---|---|---|---|---|
|unassigned_agreement_ref|path|string|true|Single value, exact match|


<h3 id="Delete an Unassigned Agreement-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|204|[No Content](https://tools.ietf.org/html/rfc7231#section-6.3.5)|No Content|None|


<h1 id="Split-API-Users">Users</h1>


All about the currently authenticated user.


## Get user details


<a id="opIdGetUserDetails"></a>


> Code samples


```shell
curl -X GET https://api-sandbox.split.cash/user \
  -H 'Accept: application/json' \
  -H 'Authorization: Bearer {access_token}'


```


```http
GET https://api-sandbox.split.cash/user HTTP/1.1
Host: api-sandbox.split.cash


Accept: application/json


```


```javascript
var headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


$.ajax({
  url: 'https://api-sandbox.split.cash/user',
  method: 'get'
  headers: headers,
  success: function(data) {
    console.log(JSON.stringify(data));
  }
})


```


```javascript--nodejs
const request = require('node-fetch');


const headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
};


fetch('https://api-sandbox.split.cash/user',
{
  method: 'GET',
  headers: headers
})
.then(function(res) {
    return res.json();
}).then(function(body) {
    console.log(body);
});


```


```ruby
require 'rest-client'
require 'json'


headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


result = RestClient.get 'https://api-sandbox.split.cash/user', {}, headers


p JSON.parse(result)


```


```python
import requests
headers = {
  'Accept': 'application/json',
  'Authorization': 'Bearer {access_token}'
}


r = requests.get('https://api-sandbox.split.cash/user', params={


}, headers = headers)


print r.json()


```


```java
URL obj = new URL("https://api-sandbox.split.cash/user");
HttpURLConnection con = (HttpURLConnection) obj.openConnection();
con.setRequestMethod("GET");
int responseCode = con.getResponseCode();
BufferedReader in = new BufferedReader(
    new InputStreamReader(con.getInputStream()));
String inputLine;
StringBuffer response = new StringBuffer();
while ((inputLine = in.readLine()) != null) {
    response.append(inputLine);
}
in.close();
System.out.println(response.toString());


```


`GET /user`


> Example responses


```json
{
  "data": {
    "first_name": "Bear",
    "last_name": "Dog",
    "mobile_phone": "0456945832",
    "email": "bear@dog.com",
    "account": {
      "name": "Dog Bones Inc",
      "nickname": "dog-bones-inc",
      "abn": "129959040",
      "phone": "0418495033",
      "street_address": "98 Acme Avenue",
      "suburb": "Lead",
      "state": "NSW",
      "postcode": "2478"
    }
  }
}
```


<h3 id="Get user details-responses">Responses</h3>


|Status|Meaning|Description|Schema|
|---|---|---|---|
|200|[OK](https://tools.ietf.org/html/rfc7231#section-6.3.1)|OK|[GetUserDetailsResponse](#schemagetuserdetailsresponse)|


# Schemas


## ProposeAgreementRequest


<a id="schemaproposeagreementrequest"></a>


```json
{
  "authoriser_id": "8df89c16-330f-462b-8891-808d7bdceb7f",
  "terms": {
    "per_payout": {
      "min_amount": null,
      "max_amount": 10000
    },
    "per_frequency": {
      "days": 7,
      "max_amount": 1000000
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|authoriser_id|string|true|The Contact's account ID (`Contact.data.account.id`)|
|terms|[Terms](#schematerms)|true|No description|


## Terms


<a id="schematerms"></a>


```json
{
  "per_payout": {
    "min_amount": 0,
    "max_amount": 10000
  },
  "per_frequency": {
    "days": 7,
    "max_amount": 1000000
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|per_payout|[PerPayout](#schemaperpayout)|true|No description|
|per_frequency|[PerFrequency](#schemaperfrequency)|true|No description|


## PerPayout


<a id="schemaperpayout"></a>


```json
{
  "min_amount": 0,
  "max_amount": 10000
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|min_amount|number|false|Minimum amount in cents a PR can be in order to be auto-approved|
|max_amount|number|false|Maximum amount in cents a PR can be in order to be auto-approved|


## PerFrequency


<a id="schemaperfrequency"></a>


```json
{
  "days": 7,
  "max_amount": 1000000
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|days|number|false|Amount of days to apply against the frequency|
|max_amount|number|false|Maximum amount in cents the total of all PRs can be for the duration of the frequency|


## ProposeAgreementResponse


<a id="schemaproposeagreementresponse"></a>


```json
{
  "data": {
    "ref": "A.2",
    "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
    "authoriser_id": "8df89c16-330f-462b-8891-808d7bdceb7f",
    "status": "proposed",
    "responded_at": null,
    "created_at": "2017-03-20T00:53:27Z",
    "terms": {
      "per_payout": {
        "max_amount": 10000,
        "min_amount": null
      },
      "per_frequency": {
        "days": 7,
        "max_amount": 1000000
      }
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## ApproveAgreementResponse


<a id="schemaapproveagreementresponse"></a>


```json
{
  "data": {
    "ref": "A.2",
    "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
    "authoriser_id": "8df89c16-330f-462b-8891-808d7bdceb7f",
    "status": "accepted",
    "responded_at": "2017-03-20T02:13:11Z",
    "created_at": "2017-03-20T00:53:27Z",
    "terms": {
      "per_payout": {
        "max_amount": 10000,
        "min_amount": 1
      },
      "per_frequency": {
        "days": 7,
        "max_amount": 1000000
      }
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## DeclineAgreementResponse


<a id="schemadeclineagreementresponse"></a>


```json
{
  "data": {
    "ref": "A.2",
    "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
    "authoriser_id": "8df89c16-330f-462b-8891-808d7bdceb7f",
    "status": "declined",
    "responded_at": "2017-03-20T02:13:11Z",
    "created_at": "2017-03-20T00:53:27Z",
    "terms": {
      "per_payout": {
        "max_amount": 10000,
        "min_amount": 1
      },
      "per_frequency": {
        "days": 7,
        "max_amount": 1000000
      }
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## GetAgreementResponse


<a id="schemagetagreementresponse"></a>


```json
{
  "data": {
    "ref": "A.2",
    "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
    "authoriser_id": "8df89c16-330f-462b-8891-808d7bdceb7f",
    "status": "approved",
    "responded_at": "2017-03-20T02:13:11Z",
    "created_at": "2017-03-20T00:53:27Z",
    "terms": {
      "per_payout": {
        "max_amount": 10000,
        "min_amount": 1
      },
      "per_frequency": {
        "days": 7,
        "max_amount": 1000000
      }
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## ListIncomingAgreementsResponse


<a id="schemalistincomingagreementsresponse"></a>


```json
{
  "data": [
    {
      "ref": "A.2",
      "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
      "authoriser_id": "8df89c16-330f-462b-8891-808d7bdceb7f",
      "status": "proposed",
      "responded_at": null,
      "created_at": "2017-03-20T00:53:27Z",
      "terms": {
        "per_payout": {
          "max_amount": 10000,
          "min_amount": 1
        },
        "per_frequency": {
          "days": 7,
          "max_amount": 1000000
        }
      }
    },
    {
      "ref": "A.1",
      "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
      "authoriser_id": "56df206a-aaff-471a-b075-11882bc8906a",
      "status": "proposed",
      "responded_at": null,
      "created_at": "2017-03-16T22:51:48Z",
      "terms": {
        "per_payout": {
          "max_amount": 5000,
          "min_amount": 0
        },
        "per_frequency": {
          "days": "1",
          "max_amount": 10000
        }
      }
    }
  ]
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|[object]|true|No description|


## ListOutgoingAgreementsResponse


<a id="schemalistoutgoingagreementsresponse"></a>


```json
{
  "data": [
    {
      "ref": "A.4",
      "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
      "authoriser_id": "8df89c16-330f-462b-8891-808d7bdceb7f",
      "status": "proposed",
      "responded_at": null,
      "created_at": "2017-03-20T00:53:27Z",
      "terms": {
        "per_payout": {
          "max_amount": 10000,
          "min_amount": 1
        },
        "per_frequency": {
          "days": 7,
          "max_amount": 1000000
        }
      }
    },
    {
      "ref": "A.3",
      "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
      "authoriser_id": "56df206a-aaff-471a-b075-11882bc8906a",
      "status": "proposed",
      "responded_at": null,
      "created_at": "2017-03-16T22:51:48Z",
      "terms": {
        "per_payout": {
          "max_amount": 5000,
          "min_amount": 0
        },
        "per_frequency": {
          "days": "1",
          "max_amount": 10000
        }
      }
    }
  ]
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|[object]|true|No description|


## ListAllBankAccountsResponse


<a id="schemalistallbankaccountsresponse"></a>


```json
{
  "data": [
    {
      "id": "6a7ed958-f1e8-42dc-8c02-3901d7057357",
      "branch_code": "493192",
      "account_number": "3993013",
      "status": "active"
    },
    {
      "id": "56df206a-aaff-471a-b075-11882bc8906a",
      "branch_code": "302193",
      "account_number": "119302",
      "status": "removed"
    }
  ]
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|[object]|true|No description|


## CreateOpenAgreementRequest


<a id="schemacreateopenagreementrequest"></a>


```json
{
  "title": "Subscription Plan A",
  "terms": {
    "per_payout": {
      "min_amount": null,
      "max_amount": 10000
    },
    "per_frequency": {
      "days": 7,
      "max_amount": 1000000
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|title|string|true|Title of the Open Agreement (Visible to authorisers)|
|terms|[Terms](#schematerms)|true|No description|


## CreateOpenAgreementResponse


<a id="schemacreateopenagreementresponse"></a>


```json
{
  "data": {
    "ref": "OA.1",
    "title": "Subscription Plan A",
    "status": "active",
    "created_at": "2017-03-20T00:53:27Z",
    "terms": {
      "per_payout": {
        "min_amount": null,
        "max_amount": 10000
      },
      "per_frequency": {
        "days": 7,
        "max_amount": 1000000
      }
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## ListAllOpenAgreementsResponse


<a id="schemalistallopenagreementsresponse"></a>


```json
{
  "data": [
    {
      "ref": "OA.1",
      "title": "Subscription Plan A",
      "status": "active",
      "created_at": "2017-03-20T00:53:27Z",
      "terms": {
        "per_payout": {
          "max_amount": 10000,
          "min_amount": null
        },
        "per_frequency": {
          "days": 7,
          "max_amount": 1000000
        }
      },
      "link": "https://go-sandbox.split.cash/open_agreements/2e002c0b-ffaf-44eb-a35c-15fa384ddde1/agreements/invitation"
    },
    {
      "ref": "OA.2",
      "title": "Subscription Plan B",
      "status": "closed",
      "created_at": "2017-03-20T00:53:27Z",
      "terms": {
        "per_payout": {
          "max_amount": 10000,
          "min_amount": null
        },
        "per_frequency": {
          "days": null,
          "max_amount": null
        }
      },
      "link": "https://go-sandbox.split.cash/open_agreements/948e3662-154d-42d1-bdc9-a05c251d3981/agreements/invitation"
    }
  ]
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|[object]|true|No description|


## ActivateOpenAgreementResponse


<a id="schemaactivateopenagreementresponse"></a>


```json
{
  "data": {
    "ref": "OA.1",
    "title": "Subscription Plan A",
    "status": "active",
    "created_at": "2017-03-20T00:53:27Z",
    "terms": {
      "per_payout": {
        "max_amount": 10000,
        "min_amount": null
      },
      "per_frequency": {
        "days": 7,
        "max_amount": 1000000
      }
    },
    "link": "https://go-sandbox.split.cash/open_agreements/2e002c0b-ffaf-44eb-a35c-15fa384ddde1/agreements/invitation"
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## CloseOpenAgreementResponse


<a id="schemacloseopenagreementresponse"></a>


```json
{
  "data": {
    "ref": "OA.1",
    "title": "Subscription Plan A",
    "status": "closed",
    "created_at": "2017-03-20T00:53:27Z",
    "terms": {
      "per_payout": {
        "max_amount": 10000,
        "min_amount": null
      },
      "per_frequency": {
        "days": 7,
        "max_amount": 1000000
      }
    },
    "link": "https://go-sandbox.split.cash/open_agreements/2e002c0b-ffaf-44eb-a35c-15fa384ddde1/agreements/invitation"
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## AddASplitContactRequest


<a id="schemaaddasplitcontactrequest"></a>


```json
{
  "nickname": "outstanding_tours"
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|nickname|string|true|Split account nickname|


## AddASplitContactResponse


<a id="schemaaddasplitcontactresponse"></a>


```json
{
  "data": {
    "id": "6a7ed958-f1e8-42dc-8c02-3901d7057357",
    "name": "Outstanding Tours Pty Ltd",
    "email": "accounts@outstandingtours.com.au",
    "type": "Split account",
    "bank_account": {
      "id": "55afddde-4296-4daf-8e49-7ba481ef9608",
      "account_number": "947434694",
      "branch_code": "304304",
      "state": "verified"
    },
    "account": {
      "id": "77be6ecc-5fa7-454b-86d6-02a5f147878d",
      "nickname": "outstanding_tours",
      "abn": "123456789",
      "name": "Outstanding Tours Pty Ltd"
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## ListAllContactsResponse


<a id="schemalistallcontactsresponse"></a>


```json
{
  "data": [
    {
      "id": "6a7ed958-f1e8-42dc-8c02-3901d7057357",
      "name": "Outstanding Tours Pty Ltd",
      "email": "accounts@outstandingtours.com.au",
      "type": "Split account",
      "bank_account": {
        "id": "095c5ab7-7fa8-40fd-b317-cddbbf4c8fbc",
        "account_number": "494307",
        "branch_code": "435434",
        "state": "verified"
      },
      "account": {
        "id": "77be6ecc-5fa7-454b-86d6-02a5f147878d",
        "nickname": "outstanding_tours",
        "abn": "123456789",
        "name": "Outstanding Tours Pty Ltd"
      }
    },
    {
      "id": "49935c67-c5df-4f00-99f4-1413c18a89a0",
      "name": "Adventure Dudes Pty Ltd",
      "email": "accounts@adventuredudes.com.au",
      "type": "Split account",
      "bank_account": {
        "id": "861ff8e4-7acf-4897-9e53-e7c5ae5f7cc0",
        "account_number": "4395959",
        "branch_code": "068231",
        "state": "verified"
      },
      "account": {
        "id": "362f7fe8-4af2-4902-b3d7-b5ab704ef2e7",
        "nickname": "adventure_dudes",
        "abn": "126754389",
        "name": "Adventure Dudes Pty Ltd"
      }
    },
    {
      "id": "eb3266f9-e172-4b6c-b802-fe5ac4d3250a",
      "name": "Surfing World Pty Ltd",
      "email": "accounts@surfingworld.com.au",
      "type": "Split account",
      "bank_account": {
        "id": "N/A",
        "account_number": "N/A",
        "branch_code": "N/A",
        "state": "disabled"
      },
      "account": {
        "id": "a31dc907-9c7a-4736-84c9-1149cf03de42",
        "nickname": "surfing_world",
        "abn": "295443789",
        "name": "Surfing World Pty Ltd"
      }
    },
    {
      "id": "6a7ed958-f1e8-42dc-8c02-3901d7057357",
      "name": "Hunter Thompson",
      "email": "hunter@batcountry.com",
      "type": "anyone",
      "bank_account": {
        "id": "55afddde-4296-4daf-8e49-7ba481ef9608",
        "account_number": "13048322",
        "branch_code": "123456",
        "state": "pending_verification"
      },
      "anyone_account": {
        "id": "77be6ecc-5fa7-454b-86d6-02a5f147878d"
      }
    }
  ]
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|[object]|true|No description|


## AddAnAnyoneContactRequest


<a id="schemaaddananyonecontactrequest"></a>


```json
{
  "name": "Hunter Thompson",
  "email": "hunter@batcountry.com",
  "branch_code": "123456",
  "account_number": "13048322"
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|name|string|true|The name of the Contact|
|email|string|true|The email of the Contact|
|branch_code|string|true|The bank account BSB of the Contact|
|account_number|string|true|The bank account number of the Contact|


## AddAnAnyoneContactResponse


<a id="schemaaddananyonecontactresponse"></a>


```json
{
  "data": {
    "id": "6a7ed958-f1e8-42dc-8c02-3901d7057357",
    "name": "Hunter Thompson",
    "email": "hunter@batcountry.com",
    "type": "anyone",
    "bank_account": {
      "id": "55afddde-4296-4daf-8e49-7ba481ef9608",
      "account_number": "13048322",
      "branch_code": "123456",
      "state": "pending_verification"
    },
    "anyone_account": {
      "id": "77be6ecc-5fa7-454b-86d6-02a5f147878d"
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## GetAContactResponse


<a id="schemagetacontactresponse"></a>


```json
{
  "data": {
    "id": "fcabeacb-2ef6-4b27-ba19-4f6fa0d57dcb",
    "name": "Outstanding Tours Pty Ltd",
    "email": "accounts@outstandingtours.com.au",
    "type": "Split account",
    "bank_account": {
      "id": "55afddde-4296-4daf-8e49-7ba481ef9608",
      "account_number": "947434694",
      "branch_code": "304304",
      "state": "pending_verification"
    },
    "account": {
      "id": "77be6ecc-5fa7-454b-86d6-02a5f147878d",
      "nickname": "outstanding_tours",
      "abn": "123456789",
      "name": "Outstanding Tours Pty Ltd"
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## UpdateAContactRequest


<a id="schemaupdateacontactrequest"></a>


```json
{
  "name": "My very own alias"
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|name|string|true|The name of the Contact|


## UpdateAContactResponse


<a id="schemaupdateacontactresponse"></a>


```json
{
  "data": {
    "id": "fcabeacb-2ef6-4b27-ba19-4f6fa0d57dcb",
    "name": "My very own alias",
    "email": "accounts@outstandingtours.com.au",
    "type": "Split account",
    "bank_account": {
      "id": "55afddde-4296-4daf-8e49-7ba481ef9608",
      "account_number": "947434694",
      "branch_code": "304304",
      "state": "pending_verification"
    },
    "account": {
      "id": "77be6ecc-5fa7-454b-86d6-02a5f147878d",
      "nickname": "outstanding_tours",
      "abn": "123456789",
      "name": "Outstanding Tours Pty Ltd"
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## MakeAPaymentRequest


<a id="schemamakeapaymentrequest"></a>


```json
{
  "description": "The SuperPackage",
  "matures_at": "2016-09-13T00:00:00Z",
  "payouts": [
    {
      "amount": 30000,
      "description": "A tandem skydive jump SB23094",
      "recipient_id": "48b89364-1577-4c81-ba02-96705895d457",
      "metadata": {
        "invoice_ref": "BILL-0001",
        "invoice_id": "c80a9958-e805-47c0-ac2a-c947d7fd778d",
        "custom_key": "Custom string",
        "another_custom_key": "Maybe a URL"
      }
    },
    {
      "amount": 30000,
      "description": "A scuba dive SDS5464",
      "recipient_id": "dc6f1e60-3803-43ca-a200-7d641816f57f"
    }
  ],
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|description|string|true|User description. Only visible to the payer|
|matures_at|string|true|Date & time in UTC ISO8601 the Payment should be processed|
|payouts|[[Payout](#schemapayout)]|true|One or many Payouts|
|metadata|[Metadata](#schemametadata)|false|No description|


## Payout


<a id="schemapayout"></a>


```json
{
  "amount": 30000,
  "description": "A tandem skydive jump SB23094",
  "recipient_id": "48b89364-1577-4c81-ba02-96705895d457",
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|amount|number|true|Amount in cents to pay the recipient|
|description|string|true|Description that both the payer an recipient can see|
|recipient_id|string|true|Contact bank account to pay (`Contact.data.bank_account.id`)|
|metadata|[Metadata](#schemametadata)|false|No description|


## Metadata


<a id="schemametadata"></a>


```json
{
  "custom_key": "Custom string",
  "another_custom_key": "Maybe a URL"
}
```


### Properties


*None*


## MakeAPaymentResponse


<a id="schemamakeapaymentresponse"></a>


```json
{
  "data": {
    "ref": "PB.1",
    "payouts": [
      {
        "ref": "D.1",
        "invoice_ref": "BILL-0001",
        "batch_description": "The SuperPackage",
        "matures_at": "2016-09-13T23:50:44Z",
        "created_at": "2016-09-10T23:50:44Z",
        "status": "maturing",
        "amount": 30000,
        "description": "A tandem skydive jump SB23094",
        "from_id": "83623359-e86e-440c-9780-432a3bc3626f",
        "to_id": "48b89364-1577-4c81-ba02-96705895d457",
        "metadata": {
          "invoice_ref": "BILL-0001",
          "invoice_id": "c80a9958-e805-47c0-ac2a-c947d7fd778d",
          "custom_key": "Custom string",
          "another_custom_key": "Maybe a URL"
        }
      },
      {
        "ref": "D.2",
        "invoice_ref": null,
        "batch_description": "The SuperPackage",
        "matures_at": "2016-09-13T23:50:44Z",
        "created_at": "2016-09-10T23:50:44Z",
        "status": "maturing",
        "amount": 30000,
        "description": "A scuba dive SDS5464",
        "from_id": "48b89364-1577-4c81-ba02-96705895d457",
        "to_id": "dc6f1e60-3803-43ca-a200-7d641816f57f"
      }
    ],
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## ApprovePaymentRequestResponse


<a id="schemaapprovepaymentrequestresponse"></a>


```json
{
  "data": {
    "ref": "PR.3",
    "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
    "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
    "status": "approved",
    "responded_at": "2016-12-19T02:38:04Z",
    "created_at": "2016-12-19T02:10:56Z",
    "debit_ref": "D.b",
    "payout": {
      "amount": 99000,
      "description": "The elite package for 4",
      "matures_at": "2016-12-25T00:00:00Z"
    },
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## DeclinePaymentRequestResponse


<a id="schemadeclinepaymentrequestresponse"></a>


```json
{
  "data": {
    "ref": "PR.3",
    "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
    "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
    "status": "declined",
    "responded_at": "2016-12-19T02:38:04Z",
    "created_at": "2016-12-19T02:10:56Z",
    "debit_ref": null,
    "payout": {
      "amount": 99000,
      "description": "The elite package for 4",
      "matures_at": "2016-12-25T00:00:00Z"
    },
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## ListAllPaymentsResponse


<a id="schemalistallpaymentsresponse"></a>


```json
{
  "data": [
    {
      "ref": "PB.1",
      "payouts": [
        {
          "ref": "D.1",
          "invoice_ref": null,
          "batch_description": "This description is only available to the payer",
          "matures_at": "2016-09-13T23:50:44Z",
          "created_at": "2016-09-10T23:50:44Z",
          "status": "maturing",
          "amount": 30000,
          "description": "The recipient will see this description",
          "from_id": "83623359-e86e-440c-9780-432a3bc3626f",
          "to_id": "48b89364-1577-4c81-ba02-96705895d457",
          "metadata": {
            "invoice_ref": "BILL-0001",
            "invoice_id": "c80a9958-e805-47c0-ac2a-c947d7fd778d",
            "custom_key": "Custom string",
            "another_custom_key": "Maybe a URL"
          }
        },
        {
          "ref": "D.2",
          "invoice_ref": null,
          "batch_description": "This description is only available to the payer",
          "matures_at": "2016-09-13T23:50:44Z",
          "created_at": "2016-09-10T23:50:44Z",
          "status": "maturing",
          "amount": 30000,
          "description": "The recipient will see this description",
          "from_id": "48b89364-1577-4c81-ba02-96705895d457",
          "to_id": "dc6f1e60-3803-43ca-a200-7d641816f57f"
        }
      ],
      "metadata": {
        "custom_key": "Custom string",
        "another_custom_key": "Maybe a URL"
      }
    }
  ]
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|[object]|true|No description|


## GetAPaymentResponse


<a id="schemagetapaymentresponse"></a>


```json
{
  "data": {
    "ref": "PB.1",
    "payouts": [
      {
        "ref": "D.1",
        "invoice_ref": null,
        "batch_description": "The SuperPackage",
        "matures_at": "2016-09-13T23:50:44Z",
        "created_at": "2016-09-10T23:50:44",
        "status": "maturing",
        "amount": 30000,
        "description": "A tandem skydive jump SB23094",
        "from_id": "83623359-e86e-440c-9780-432a3bc3626f",
        "to_id": "48b89364-1577-4c81-ba02-96705895d457",
        "metadata": {
          "invoice_ref": "BILL-0001",
          "invoice_id": "c80a9958-e805-47c0-ac2a-c947d7fd778d",
          "custom_key": "Custom string",
          "another_custom_key": "Maybe a URL"
        }
      },
      {
        "ref": "D.2",
        "invoice_ref": null,
        "batch_description": "The SuperPackage",
        "matures_at": "2016-09-13T23:50:44Z",
        "created_at": "2016-09-10T23:50:44Z",
        "status": "maturing",
        "amount": 30000,
        "description": "A scuba dive SDS5464",
        "from_id": "48b89364-1577-4c81-ba02-96705895d457",
        "to_id": "dc6f1e60-3803-43ca-a200-7d641816f57f"
      }
    ],
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## MakeAPaymentRequestRequest


<a id="schemamakeapaymentrequestrequest"></a>


```json
{
  "description": "Visible to both initiator and authoriser",
  "matures_at": "12/19/2016 2:10:56 AM",
  "amount": 99000,
  "authoriser_id": "de86472c-c027-4735-a6a7-234366a27fc7",
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|description|string|true|Description visible to the initiator (payee) & authoriser (payer)|
|matures_at|string|true|Date & time in UTC ISO8601 that the Payment will be processed if the request is approved|
|amount|number|true|Amount in cents to pay the initiator|
|authoriser_id|string|true|The Contact bank account that will be used to pay the PR (`Contact.data.bank_account.id`)'|
|metadata|[Metadata](#schemametadata)|false|No description|


## MakeAPaymentRequestResponse


<a id="schemamakeapaymentrequestresponse"></a>


```json
{
  "data": {
    "ref": "PR.3",
    "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
    "authoriser_id": "de86472c-c027-4735-a6a7-234366a27fc7",
    "status": "pending_approval",
    "responded_at": null,
    "created_at": "2016-12-19T02:10:56Z",
    "credit_ref": null,
    "payout": {
      "amount": 99000,
      "description": "The elite package for 4",
      "matures_at": "2016-12-25T00:00:00Z"
    },
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## GetAPaymentRequestResponse


<a id="schemagetapaymentrequestresponse"></a>


```json
{
  "data": {
    "ref": "PR.3",
    "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
    "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
    "status": "approved",
    "responded_at": "2016-12-19T02:38:04Z",
    "created_at": "2016-12-19T02:10:56Z",
    "credit_ref": "C.b",
    "payout": {
      "amount": 99000,
      "description": "The elite package for 4",
      "matures_at": "2016-12-25T00:00:00Z"
    },
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## ListIncomingPaymentRequestsResponse


<a id="schemalistincomingpaymentrequestsresponse"></a>


```json
{
  "data": [
    {
      "ref": "PR.2",
      "initiator_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
      "authoriser_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
      "status": "approved",
      "responded_at": "2016-12-19T02:10:18Z",
      "created_at": "2016-12-19T02:09:09Z",
      "debit_ref": "D.a",
      "payout": {
        "amount": 30000,
        "description": "The SuperPackage",
        "matures_at": "2016-12-20T00:00:00Z"
      }
    },
    {
      "ref": "PR.3",
      "initiator_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
      "authoriser_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
      "status": "pending_approval",
      "responded_at": null,
      "created_at": "2016-12-19T02:10:56Z",
      "debit_ref": null,
      "payout": {
        "amount": 99000,
        "description": "The elite package for 4",
        "matures_at": "2016-12-25T00:00:00Z"
      },
      "metadata": {
        "custom_key": "Custom string",
        "another_custom_key": "Maybe a URL"
      }
    }
  ]
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|[object]|true|No description|


## ListOutgoingPaymentRequestsResponse


<a id="schemalistoutgoingpaymentrequestsresponse"></a>


```json
{
  "data": [
    {
      "ref": "PR.4",
      "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
      "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
      "status": "approved",
      "responded_at": "2016-12-19T02:10:18Z",
      "created_at": "2016-12-19T02:09:09Z",
      "credit_ref": "C.a",
      "payout": {
        "amount": 30000,
        "description": "The SuperPackage",
        "matures_at": "2016-12-20T00:00:00Z"
      }
    },
    {
      "ref": "PR.5",
      "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
      "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
      "status": "pending_approval",
      "responded_at": null,
      "created_at": "2016-12-19T02:10:56Z",
      "credit_ref": null,
      "payout": {
        "amount": 99000,
        "description": "The elite package for 4",
        "matures_at": "2016-12-25T00:00:00Z"
      }
    }
  ]
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|[object]|true|No description|


## GetAPaymentRequestsHistoryResponse


<a id="schemagetapaymentrequestshistoryresponse"></a>


```json
{
  "data": [
    {
      "type": "payout_request",
      "event": "requested",
      "at": "2017-01-05T07:47:45Z",
      "ref": "PR.3",
      "by": "Fancy Pants (fancy_pants)"
    },
    {
      "type": "payout_request",
      "event": "approved",
      "at": "2017-01-07T06:13:52Z",
      "ref": "PR.3",
      "by": "Lycra Co (lycra_co)"
    },
    {
      "type": "debit",
      "event": "scheduled",
      "at": "2017-01-07T06:13:52Z",
      "ref": "D.n",
      "by": "Split Payments"
    },
    {
      "type": "credit",
      "event": "scheduled",
      "at": "2017-01-07T06:13:52Z",
      "ref": "C.e",
      "by": "Split Payments"
    },
    {
      "type": "debit",
      "event": "matured",
      "at": "2017-01-08T04:30:14Z",
      "ref": "D.n",
      "by": "Split Payments"
    },
    {
      "type": "debit",
      "event": "processing",
      "at": "2017-01-08T04:30:14Z",
      "ref": "D.n",
      "by": "Split Payments"
    },
    {
      "type": "debit",
      "event": "clearing",
      "at": "2017-01-08T19:02:20Z",
      "ref": "D.n",
      "by": "Split Payments"
    },
    {
      "type": "debit",
      "event": "cleared",
      "at": "2017-01-11T19:07:52Z",
      "ref": "D.n",
      "by": "Split Payments"
    },
    {
      "type": "credit",
      "event": "matured",
      "at": "2017-01-11T19:07:52Z",
      "ref": "C.e",
      "by": "Split Payments"
    },
    {
      "type": "credit",
      "event": "processing",
      "at": "2017-01-12T04:30:25Z",
      "ref": "C.e",
      "by": "Split Payments"
    },
    {
      "type": "credit",
      "event": "clearing",
      "at": "2017-01-12T05:17:32Z",
      "ref": "C.e",
      "by": "Split Payments"
    },
    {
      "type": "credit",
      "event": "cleared",
      "at": "2017-01-15T05:27:12Z",
      "ref": "C.e",
      "by": "Split Payments"
    }
  ]
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|[object]|true|No description|


## IssueARefundRequest


<a id="schemaissuearefundrequest"></a>


```json
{
  "amount": 500,
  "reason": "Because reason",
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|amount|number|true|Amount in cents refund|
|reason|string|false|Reason for the refund. Visible to both parties.|
|metadata|[Metadata](#schemametadata)|false|No description|


## IssueARefundResponse


<a id="schemaissuearefundresponse"></a>


```json
{
  "data": {
    "ref": "PRF.1",
    "for_ref": "C.59",
    "debit_ref": "D.hi",
    "created_at": "2017-05-08T07:20:24Z",
    "amount": 500,
    "reason": "Because reason",
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## ListIncomingRefundsResponse


<a id="schemalistincomingrefundsresponse"></a>


```json
{
  "data": [
    {
      "ref": "PRF.2",
      "for_ref": "D.5",
      "credit_ref": "C.q",
      "created_at": "2017-05-09T04:45:26Z",
      "amount": 5,
      "reason": "Because reason",
      "metadata": {
        "custom_key": "Custom string",
        "another_custom_key": "Maybe a URL"
      }
    }
  ]
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|[object]|true|No description|


## ListOutgoingRefundsResponse


<a id="schemalistoutgoingrefundsresponse"></a>


```json
{
  "data": [
    {
      "ref": "PRF.2",
      "for_ref": "C.5",
      "debit_ref": "D.5a",
      "created_at": "2017-05-09T04:45:26Z",
      "amount": 5,
      "reason": "Because reason",
      "metadata": {
        "custom_key": "Custom string",
        "another_custom_key": "Maybe a URL"
      }
    }
  ]
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|[object]|true|No description|


## RetrieveARefundResponse


<a id="schemaretrievearefundresponse"></a>


```json
{
  "data": {
    "ref": "PRF.1",
    "for_ref": "C.59",
    "debit_ref": "D.hi",
    "created_at": "2017-05-08T07:20:24Z",
    "amount": 500,
    "reason": "Because reason",
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## RequestARefundRequest


<a id="schemarequestarefundrequest"></a>


```json
{
  "for_ref": "D.1",
  "amount": 500,
  "reason": "Because reason",
  "metadata": {
    "custom_key": "Custom string",
    "another_custom_key": "Maybe a URL"
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|for_ref|string|true|The Payout debit reference to refund against|
|amount|number|true|Amount in cents to request from the original payout recipient|
|reason|string|false|Reason for the refund request. Visible to both parties.|
|metadata|[Metadata](#schemametadata)|false|No description|


## RequestARefundResponse


<a id="schemarequestarefundresponse"></a>


```json
{
  "data": {
    "ref": "RR.2",
    "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
    "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
    "status": "pending_approval",
    "responded_at": null,
    "created_at": "2016-12-19T04:34:38Z",
    "for_ref": "D.1",
    "credit_ref": null,
    "amount": 500,
    "reason": "Because reasons",
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## RetrieveARefundRequestResponse


<a id="schemaretrievearefundrequestresponse"></a>


```json
{
  "data": {
    "ref": "RR.2",
    "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
    "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
    "status": "pending_approval",
    "responded_at": null,
    "created_at": "2016-12-19T04:34:38Z",
    "for_ref": "D.1",
    "credit_ref": null,
    "amount": 10000,
    "reason": "Because reasons",
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## ApprovePayoutRefundRequestResponse


<a id="schemaapprovepayoutrefundrequestresponse"></a>


```json
{
  "data": {
    "ref": "RR.2",
    "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
    "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
    "status": "approved",
    "responded_at": "2016-12-19T04:42:59Z",
    "created_at": "2016-12-19T04:34:38Z",
    "for_ref": "C.1",
    "debit_ref": "D.2c3",
    "amount": 100,
    "reason": "Because reasons",
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## DeclinePayoutRefundRequestResponse


<a id="schemadeclinepayoutrefundrequestresponse"></a>


```json
{
  "data": {
    "ref": "RR.2",
    "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
    "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
    "status": "declined",
    "responded_at": "2016-12-19T04:42:59Z",
    "created_at": "2016-12-19T04:34:38Z",
    "for_ref": "D.1",
    "debit_ref": null,
    "amount": 100,
    "reason": "Because reasons",
    "metadata": {
      "custom_key": "Custom string",
      "another_custom_key": "Maybe a URL"
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## ListIncomingRefundRequestsResponse


<a id="schemalistincomingrefundrequestsresponse"></a>


```json
{
  "data": [
    {
      "ref": "RR.2",
      "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
      "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
      "status": "approved",
      "responded_at": "2016-12-19T04:42:59Z",
      "created_at": "2016-12-19T04:34:38Z",
      "for_ref": "C.1",
      "debit_ref": "D.2c3",
      "amount": 100,
      "reason": "Because reasons",
      "metadata": {
        "custom_key": "Custom string",
        "another_custom_key": "Maybe a URL"
      }
    }
  ]
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|[object]|true|No description|


## ListOutgoingRefundRequestsResponse


<a id="schemalistoutgoingrefundrequestsresponse"></a>


```json
{
  "data": [
    {
      "ref": "RR.2",
      "initiator_id": "ca7bc5b3-e47f-4153-96fb-bbe326b42772",
      "authoriser_id": "fb6a9252-3818-44dc-b5aa-2195391a746f",
      "status": "pending_approval",
      "responded_at": null,
      "created_at": "2016-12-19T04:34:38Z",
      "for_ref": "D.1",
      "credit_ref": null,
      "amount": 10000,
      "reason": "Because reasons",
      "metadata": {
        "custom_key": "Custom string",
        "another_custom_key": "Maybe a URL"
      }
    }
  ]
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|[object]|true|No description|


## ListAllTransactionsResponse


<a id="schemalistalltransactionsresponse"></a>


```json
{
  "data": [
    {
      "ref": "D.3",
      "parent_ref": null,
      "type": "debit",
      "category": "payout_refund",
      "created_at": "2016-12-07T23:15:00Z",
      "matures_at": "2016-12-10T23:15:00Z",
      "cleared_at": null,
      "bank_ref": null,
      "status": "Pending",
      "party_name": "Sanford-Rees",
      "party_nickname": "sanford-rees-8",
      "description": null,
      "amount": 1
    },
    {
      "ref": "D.2",
      "parent_ref": "PB.2",
      "type": "debit",
      "category": "payout",
      "created_at": "2016-12-06T23:15:00Z",
      "matures_at": "2016-12-09T23:15:00Z",
      "cleared_at": null,
      "bank_ref": null,
      "status": " Pending",
      "party_name": "Gutmann-Schmidt",
      "party_nickname": "gutmann-schmidt-6",
      "description": null,
      "amount": 1
    },
    {
      "ref": "C.2",
      "parent_ref": null,
      "type": "credit",
      "category": "payout",
      "created_at": "2016-12-05T23:15:00Z",
      "matures_at": "2016-12-06T23:15:00Z",
      "cleared_at": "2016-12-09T23:15:00Z",
      "bank_ref": "CT.1",
      "status": "Pending",
      "party_name": "Price and Sons",
      "party_nickname": "price-and-sons-2",
      "description": "Money for jam",
      "amount": 1
    }
  ]
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|[object]|true|No description|


## ProposeUnassignedAgreementRequest


<a id="schemaproposeunassignedagreementrequest"></a>


```json
{
  "expiry_in_seconds": 60,
  "terms": {
    "per_payout": {
      "min_amount": null,
      "max_amount": 10000
    },
    "per_frequency": {
      "days": 7,
      "max_amount": 1000000
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|expiry_in_seconds|number|true|The amount of time in seconds before the Unassigned Agreement can no longer be accepted.|
|terms|[Terms](#schematerms)|true|No description|


## ProposeUnassignedAgreementResponse


<a id="schemaproposeunassignedagreementresponse"></a>


```json
{
  "data": {
    "ref": "A.4k",
    "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
    "status": "proposed",
    "responded_at": null,
    "created_at": "2017-03-20T00:53:27Z",
    "terms": {
      "per_payout": {
        "max_amount": 10000,
        "min_amount": null
      },
      "per_frequency": {
        "days": 7,
        "max_amount": 1000000
      }
    },
    "assignment_expires_at": "2017-03-20T00:54:27Z",
    "link": "https://go-sandbox.split.cash/unassigned_agreements/b61fc159-8779-4a17-a826-e398e3e7e211/invitation"
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## ListUnassignedAgreementsResponse


<a id="schemalistunassignedagreementsresponse"></a>


```json
{
  "data": [
    {
      "ref": "A.4k",
      "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
      "status": "proposed",
      "responded_at": null,
      "created_at": "2017-03-20T00:53:27Z",
      "terms": {
        "per_payout": {
          "max_amount": 10000,
          "min_amount": null
        },
        "per_frequency": {
          "days": 7,
          "max_amount": 1000000
        }
      },
      "assignment_expires_at": "2017-03-20T00:54:27Z",
      "link": "https://go-sandbox.split.cash/unassigned_agreements/b61fc159-8779-4a17-a826-e398e3e7e211/invitation"
    },
    {
      "ref": "A.7ea",
      "initiator_id": "b61fc159-8779-4a17-a826-e398e3e7e211",
      "status": "proposed",
      "responded_at": null,
      "created_at": "2017-03-21T00:53:27Z",
      "terms": {
        "per_payout": {
          "max_amount": null,
          "min_amount": null
        },
        "per_frequency": {
          "days": null,
          "max_amount": null
        }
      },
      "assignment_expires_at": "2017-03-21T00:54:27Z",
      "link": "https://go-sandbox.split.cash/unassigned_agreements/4e2728cc-b4ba-42c2-a6c3-26a7758de58d/invitation"
    }
  ]
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|[object]|true|No description|


## GetUnassignedAgreementResponse


<a id="schemagetunassignedagreementresponse"></a>


```json
{
  "data": {
    "ref": "A.4k",
    "initiator_id": "4e2728cc-b4ba-42c2-a6c3-26a7758de58d",
    "status": "proposed",
    "responded_at": null,
    "created_at": "2017-03-20T00:53:27Z",
    "terms": {
      "per_payout": {
        "max_amount": 10000,
        "min_amount": null
      },
      "per_frequency": {
        "days": 7,
        "max_amount": 1000000
      }
    },
    "assignment_expires_at": "2017-03-20T00:54:27Z",
    "link": "https://go-sandbox.split.cash/unassigned_agreements/b61fc159-8779-4a17-a826-e398e3e7e211/invitation"
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


## GetUserDetailsResponse


<a id="schemagetuserdetailsresponse"></a>


```json
{
  "data": {
    "first_name": "Bear",
    "last_name": "Dog",
    "mobile_phone": "0456945832",
    "email": "bear@dog.com",
    "account": {
      "name": "Dog Bones Inc",
      "nickname": "dog-bones-inc",
      "abn": "129959040",
      "phone": "0418495033",
      "street_address": "98 Acme Avenue",
      "suburb": "Lead",
      "state": "NSW",
      "postcode": "2478"
    }
  }
}
```


### Properties


|Name|Type|Required|Description|
|---|---|---|---|
|data|object|true|No description|


