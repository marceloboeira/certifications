# Cognito

Web Identify Federation, uses OAuth2 to provide credentials based on external authenticated identities.

* Sign-up/in
* Access for guest users
* Acts as an identity broker between your app and web-providers
* Synchronizes your user data from multiple devices
* The users authenticate and are mapped to an IAM role to get access to resources
* Cognito User Pool
  * User directory to manage users
  * Uses JWTs (JSON Web Tokens)
  * Token can be used to get access to other services (e.g.: API Gateway, Lambda...)
* Identity Pool
  * Internal AWS Account Authentication/Authorization
  * Mapping of which users have which types of access and providing internal tokens
  * Creates a temporary token within AWS (for S3, Dynamo...)
  * Returns an STS Token
