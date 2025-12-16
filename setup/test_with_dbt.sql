-- test dbt 
CREATE OR REPLACE GIT REPOSITORY TASTY_BYTES
  API_INTEGRATION = git_integration
  ORIGIN = 'https://github.com/oodata-de/getting-started-with-dbt-on-snowflake';