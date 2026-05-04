# Part B Private Evidence Checklist

Raw evidence is kept outside the public/team repo.

## Primary Jira plugin candidate

Private evidence available:

- local lab setup notes;
- user and private-channel membership proof;
- baseline forbidden result for the normal channel-subscription path;
- successful subscription-template list/edit/delete/create results;
- persisted state before/after snapshots;
- source trace for normal authorization checks vs template handlers;
- public novelty-search notes;
- conservative severity and impact notes.

## Backup GitHub plugin candidate

Private evidence available:

- private-channel/post access denial through Mattermost core;
- successful plugin-side behavior using private post reference;
- plugin-created private-channel reply behavior;
- source trace and duplicate-risk notes.

## Excluded from repository

Do not commit:

- raw HTTP requests/responses;
- tokens, cookies, or auth headers;
- exact private channel/post/template IDs;
- full KV/database snapshots;
- exploit scripts;
- vendor-report drafts before responsible disclosure.
