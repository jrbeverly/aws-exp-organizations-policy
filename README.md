# AWS Organization Structure Experiments - Mirrored Organizations

Experiments with AWS Organization structure and potential SCP policies.

## Notes


- The entire organization unit hierarchy shouldn't be a single entity for mirroring. Makes it difficult to evaluate in "isolation"
- Entire organization mirrors can work with the SCPs, but internal permissions (e.g. S3 Bucket) still might have issues
- Organizations should include a uniqueness component to allow for constructing a new version (& prototyping)
- SCPs seem like they would benefit in cases where there is a sort of "State machine" in the SCP
- State machine examples are "During provisioning of account, need to create IAM Users, but from then on no users should be created"
- Account boundaries for services as a way of strictly locking things makes it easier to have `DenyKMS` and other such policies
- Region denies only apply after provisioning, as we need to purge the "default VPCs" created when an AWS Account is created (+ any other "default" resources)
- AWS Password Policy / AWS IAM Account Name / Etc are all good examples of something that should only need to be provisioned "once"
- SCPs give a potential idea for the concept of "Immutable AWS Account Infrastructure", that require you to create a new AWS Account (+ migrate resources) rather than edit them
- Sandbox/Staging organizations can contain the developer workloads that are for sandbox/development
- Developer workloads should be contained within accoounts that can be created/decommissioned on a release schedule (see ubuntu - Bionic Beaver, Focal Fossa, Xenial Xerus)

More investigation is needed into this idea, as the exact "concern" that this kind of structure & SCP policy layout will handle is kind of vague. Although grouping AWS Accounts and associating tags with them can be useful for things like data residency / storage compliance, its not immediately clear how this design maps to the "problem" itself.

SCPs seem like they would be a good guardrail, but have concerns that it would encounter issues in cases with the rule being enforced at all times, vs a more state machine concept (e.g. [Provisioning (allowed) => Running (not allowed)])