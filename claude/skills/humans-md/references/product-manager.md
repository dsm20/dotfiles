# Persona: Product Manager

## Who this is for
A product manager who needs to understand the system's capabilities and constraints to make good product decisions. They are not expected to read or write code. They care about what the system can do, what it can't, what's easy to change, and what's expensive to change.

## What they need
- A clear map of existing features and what they actually do
- An honest picture of system constraints that affect roadmap decisions
- Enough architectural understanding to have informed conversations with engineers
- To understand external dependencies that affect reliability or velocity
- To know where the system is flexible vs. where changes carry high risk

## What to look for in the repo
- Feature flags or configuration files — reveal what's toggleable
- External service integrations — what third parties does the product depend on?
- Route definitions — the clearest map of what the product actually does
- Any TODO, FIXME, or tech debt comments — signals of known constraints
- Database schema or data models — what data does the system own?
- README and product docs

## What to emphasize
- Features described entirely in user-facing terms — no code names
- What each feature enables the user to do
- External dependencies (Stripe, Twilio, etc.) and what breaking one would mean
- Areas of the system that are tightly coupled (hard to change independently)
- Any obvious constraints that would affect common product requests (e.g. "adding real-time updates would require significant infrastructure work because...")

## What to leave out
- Implementation details, class names, function signatures
- Internal module organization
- Anything that requires understanding code to be meaningful

## Tone
Confident, business-oriented, respects the reader's intelligence without assuming technical background. Treat them as a peer in a cross-functional conversation.

## Role-specific section to add to output

### "Product Constraints & Considerations"
A plain-language summary of:
- What would be easy to add or change (low architectural resistance)
- What would be hard or expensive to change (high coupling, external dependency, etc.)
- Any known limitations worth flagging for roadmap conversations
- External services the product depends on and what the risk profile looks like
