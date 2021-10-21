# Medication-Tracker

## To add/remove/update allowed IP addresses:

### When is this needed?
- If you would like to add/remove program access of a specific IP address.
- If the IP address of a previously allowed device has changed. You can update the IP address to continue to allow access.
  - If this is the case, when attempting to get medications you may receive a `403` response with a message regarding denied access.

### How to view/update allowed IP addresses:
- Login to AWS console and visit API Gateway.
- Select medication-tracker from the list of APIs.
- In the "Resource Policy" tab, the configuration for access is shown. Be sure to change/update/remove an IP address from both sections listed under `"aws:SourceIp"`. Save the configuration.
- Deploy the API:
  - Go to the "Resources" tab. Open the "Actions" dropdown menu and select "Deploy API". Select "Prod" as the stage (should be the only option) and click "Deploy".
