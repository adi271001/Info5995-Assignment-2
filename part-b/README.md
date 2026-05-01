# Part B Finding Summary — Mattermost Bug Bounty Candidate

This folder contains a **sanitized team coordination summary** for INFO5995 Assignment 2 Part B.

The full technical evidence is intentionally kept out of this public/team repository until tutor/coordinator guidance and responsible disclosure handling are confirmed.

## Primary candidate

**Mattermost Jira plugin subscription-template authorization bypass**

A low-privileged authenticated Mattermost user connected to Jira appears able to access and mutate Jira subscription-template configuration associated with a private channel they are not a member of.

Conservative impact framing:

- unauthorized private-channel Jira subscription-template configuration disclosure;
- unauthorized tampering/deletion/creation of integration template records;
- private-channel integration metadata exposure.

Current severity framing: **Medium / Bugcrowd P3-ish**.

Current novelty framing: **likely zero-day candidate / apparently undisclosed**, pending tutor/coordinator sanity check and external triage.

Do **not** overclaim:

- private message reading;
- private attachment/body exfiltration;
- active notification delivery into the private channel;
- confirmed zero-day status.

## Backup candidate

**Mattermost GitHub plugin arbitrary post-reference authorization gap**

A second candidate suggests a GitHub plugin object-authorization issue involving private-channel post references. This is treated as backup only because duplicate risk is higher due to a public Mattermost Jira-plugin CVE in the same broad bug class.

Conservative impact framing:

- plugin-side action using a private-channel post reference;
- private-channel plugin reply/injection behavior;
- no claim of private message-body or attachment exfiltration.

## Evidence handling

Raw evidence is intentionally excluded from this repository, including:

- request/response logs;
- authentication/session material;
- database/KV snapshots;
- exact private IDs;
- exploit scripts or reproduction commands;
- Bugcrowd-ready report drafts.

A sanitized evidence pack can be shared privately with the tutor/coordinator if requested.
