use database testing;
use schema notebooks;

CREATE OR REPLACE NETWORK RULE fx_api_rule 
  TYPE = HOST_PORT -- indicates that the network rule will allow outgoing network traffic based on the domain of the request destination.
  MODE = EGRESS --Allows Snowflake to send requests to an external destination
  VALUE_LIST = ('api.exchangerate-api.com:443');

-- Snowflake Secrets or parameter tables instead of hardcoding API keys
CREATE SECRET service_now_creds_pw
  TYPE = password
  USERNAME = ''
  PASSWORD = '';


-- allow Snowflake to call external APIs directly
-- enables outbound traffic from Snowflake’s secure environment to approved third-party domains
-- will need to reference secrets (ALLOWED AUTHENTICATION SECRETS) if needed (in this case, not needed)
-- External access is not supported for trial accounts
CREATE OR REPLACE EXTERNAL ACCESS INTEGRATION fx_api_integration
  ALLOWED_NETWORK_RULES = (fx_api_rule)
  ENABLED = true;

GRANT USAGE ON INTEGRATION fx_api_integration TO ROLE your_role;

CREATE OR REPLACE STAGE NB_TEST_STAG


call system$snowservices_resolve_ingress('eqbrav-ndqwybu-mrb80510')