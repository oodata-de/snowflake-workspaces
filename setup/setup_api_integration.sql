-- ------------------------------------
-- Set up API integration for all users
-- ------------------------------------
USE ROLE ACCOUNTADMIN;
CREATE OR REPLACE API INTEGRATION WS_DEMO_GIT_INTEGRATION
  API_PROVIDER = git_https_api
  API_ALLOWED_PREFIXES = ('https://github.com/mferle')
  API_USER_AUTHENTICATION = (TYPE = SNOWFLAKE_GITHUB_APP)
  ENABLED = TRUE;

-- grant usage on the API integration to all users
GRANT USAGE ON INTEGRATION WS_DEMO_GIT_INTEGRATION TO ROLE PUBLIC;


create or replace api integration int_sf_workspace_outh
    api_provider = git_https_api
    api_allowed_prefixes = ('https://github.com/oodata-de/snowflake-workspaces')
    enabled = true
    allowed_authentication_secrets = all
    api_user_authentication = (type = snowflake_github_app ) -- enable OAuth support
    -- comment='<comment>';

SHOW INTEGRATIONS;
