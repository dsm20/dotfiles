---
name: humans-md
description: "Generates a HUMANS.md file for a code repository — a human-readable document that connects the actual product and its features to the underlying architecture. Use this skill whenever the user says 'generate HUMANS.md', 'create HUMANS.md', or asks for a human-readable architecture doc, onboarding doc, or product-to-code explainer for a repo. Supports role-based output: 'generate HUMANS.md for product manager', 'generate HUMANS.md for security', 'generate HUMANS.md for senior engineer'. Default role is new engineer. This is NOT a replacement for CLAUDE.md — it is the human counterpart to it."
---

# HUMANS.md Skill

## Purpose

HUMANS.md is the human counterpart to CLAUDE.md. Where CLAUDE.md gives an AI agent operational instructions for working in a codebase, HUMANS.md gives a human reader a mental model of the product and how the code behind it is organized.

The core principle: **architecture is only meaningful when connected to the product it powers.** HUMANS.md always starts with what the product does and works inward to how the code makes it possible.

---

## Step 1: Detect the Role

Check the user's request for a role specifier:

| User says | Load persona file |
|---|---|
| "for new engineer" or no role specified | `references/new-engineer.md` |
| "for product manager" or "for PM" | `references/product-manager.md` |
| "for security" or "for security reviewer" | `references/security.md` |
| "for senior engineer" or "for tech lead" | `references/senior-engineer.md` |
| Any other role | Use `references/new-engineer.md` as base, adapt tone |

Load the appropriate persona file before proceeding. It defines what to look for, what to emphasize, and what to leave out.

---

## Step 2: Understand the Product

Before reading a single line of architecture, establish the product layer. Look at:

- `README.md` — what does this project say it is?
- Any `/docs` folder, wiki links, or product description files
- The app's own UI if described anywhere (routes, page names, feature flags)
- `package.json`, `pyproject.toml`, or equivalent — app name, description, scripts
- CLAUDE.md if present — it may contain useful context even though it's agent-focused

Goal: be able to answer in 2-3 sentences — *what is this product, who uses it, and what are its primary features?*

If you cannot answer this from the repo, say so clearly in the document and work with what you have.

---

## Step 3: Map the Features

Identify the product's main features or capabilities — ideally 4-8. These become the spine of the document. Think in user-facing terms, not code terms:

- ✅ "User authentication and session management"
- ✅ "Payment processing and subscription billing"
- ❌ "AuthService module"
- ❌ "StripeAdapter class"

Use routes, controllers, top-level modules, and any product docs to derive this list.

---

## Step 4: Connect Features to Architecture

For each feature, trace the path from product to code. The goal is not exhaustive coverage — it's to give the reader enough that they could find their way around. Cover:

- Which part of the codebase owns this feature
- Any key dependencies, external services, or notable patterns
- Anything non-obvious that would take a newcomer time to discover

Depth varies by persona — follow the loaded persona file's guidance.

---

## Step 5: Write the Document

Output a markdown file named based on the role:

| Role | Output filename |
|---|---|
| New Engineer (default) | `HUMANS.md` |
| Product Manager | `HUMANS-productmanager.md` |
| Security | `HUMANS-security.md` |
| Senior Engineer | `HUMANS-seniorengineer.md` |

Every HUMANS.md document follows this structure:

```
# HUMANS.md
> Generated: [date] | Role: [role] | Repo: [repo name]

## What Is This?
2-3 sentence plain-language description of the product.

## Who Uses It and How
Brief description of the user and their primary interactions.

## Features
A list of the main features with 1-2 sentence descriptions each.

## Architecture Overview
High-level description of how the system is structured — 
not every module, just the meaningful layers and boundaries.

## Feature → Code Map
For each feature: what it does, where it lives, anything worth knowing.

## Key Dependencies & External Services
What the system relies on outside itself.

## [Role-specific section]
Defined in the persona file.
```

---

## Guiding Principles

- **Product first, code second.** A reader should understand what the system does before they understand how.
- **No unexplained jargon.** If you use a technical term, briefly say what it means in context.
- **Honest about gaps.** If the repo doesn't make something clear, say so rather than guessing.
- **Not exhaustive.** Cover the 20% of the codebase that explains 80% of what the product does.
- **Opinionated about what matters.** A flat list of every module is not useful. Prioritize ruthlessly.
