# Part B Presentation Outline

Target length: <= 5 minutes.

## 1. Target and scope

- Target: Mattermost Bugcrowd program / Mattermost plugin ecosystem.
- Testing environment: local self-hosted Mattermost lab with local mock integration services.
- Safety: no disruptive testing against any public target.

## 2. Main finding

**Mattermost Jira plugin subscription-template authorization bypass**

Short explanation:

- The normal channel-subscription path rejects a user who is not a private-channel member.
- A separate subscription-template path appears to miss the same Mattermost channel authorization check.
- This lets the unauthorized user interact with template configuration tied to the private channel.

## 3. Evidence to describe verbally

- User/member setup proves the test user is not in the private channel.
- Baseline request to the normal channel-subscription path returns forbidden.
- Subscription-template operations succeed against the same private-channel target.
- Persisted plugin state confirms the unauthorized changes.
- Source review shows Jira project/client validation but no equivalent Mattermost channel membership or manage-subscription permission check in the template path.

Do not show raw credentials, private IDs, raw request logs, or full exploit commands in the public repo.

## 4. Impact

Conservative impact:

- unauthorized disclosure of private-channel Jira subscription-template configuration;
- unauthorized tampering with integration template state;
- integrity/availability risk for private-channel integration configuration.

Do not claim private message reading or active notification delivery unless separately proven.

## 5. Severity and novelty

- Safest severity: Medium / Bugcrowd P3-ish.
- Novelty: likely zero-day candidate / apparently undisclosed based on public searches, but not confirmed until vendor/platform triage.
- Backup issue exists in the GitHub plugin, but should not be the main story due to higher duplicate risk.

## 6. Mitigation

Apply Mattermost channel authorization checks to subscription-template operations:

- authorize list results against the requester’s channel access/management permission;
- authorize create/edit against the submitted target channel;
- authorize edit/delete against the existing stored template channel before mutation.
