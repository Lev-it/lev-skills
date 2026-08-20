---
name: legal-templates
description: Attorney-drafted legal document templates for startups and tech companies. Use whenever a user needs to draft, review, or customize a legal agreement — NDA, privacy policy, terms of service, DPA, MSA, offer letter, BAA, cookie notice, or advisor agreement.
---

# Legal Templates

Attorney-drafted templates from [General Legal](https://general.legal), released under CC0 1.0. Free to use, modify, and distribute without attribution.

Templates are in LLM-optimized markdown. Fields marked with `<mark>` tags must be customized for the user's situation.

## Available Templates

| Template | File | Use when |
| --- | --- | --- |
| **Mutual NDA** | [mutual-nda.md](./mutual-nda.md) | Both parties share confidential info (e.g. partnership exploration) |
| **One-Way NDA** | [one-way-nda.md](./one-way-nda.md) | Only one party discloses confidential info |
| **Privacy Policy (U.S.)** | [privacy-policy-us.md](./privacy-policy-us.md) | U.S.-only product; covers CCPA/CPRA |
| **Privacy Policy (GDPR)** | [privacy-policy-gdpr.md](./privacy-policy-gdpr.md) | Multi-jurisdiction product; covers U.S. + GDPR/UK GDPR |
| **Terms of Use** | [terms-of-use.md](./terms-of-use.md) | Website or app terms covering access, IP, liability, disputes |
| **Cookie Notice** | [cookie-notice.md](./cookie-notice.md) | Cookie and tracking disclosure for websites/apps |
| **Data Processing Addendum (U.S.)** | [dpa-us.md](./dpa-us.md) | Processor agreement for U.S. personal data |
| **Data Processing Addendum (Global)** | [dpa-global.md](./dpa-global.md) | Processor agreement for U.S. + EU/EEA/UK/Switzerland |
| **Business Associate Agreement (BAA)** | [business-associate-agreement.md](./business-associate-agreement.md) | HIPAA-required contract for handling protected health information |
| **Master Services Agreement** | [master-services-agreement.md](./master-services-agreement.md) | Tech-oriented MSA for software/platform/integration services |
| **Advisor Agreement** | [advisor-agreement.md](./advisor-agreement.md) | Advisory services, equity compensation, IP assignment, confidentiality |
| **Employee Offer Letter (CA Exempt)** | [employee-offer-letter.md](./employee-offer-letter.md) | Offer letter for California exempt hires |

## How to use

1. **Identify** the right template from the table above.
2. **Read the full template** from the reference file before presenting it.
3. **Ask the user** for any information needed to fill in `<mark>[...]</mark>` fields (company name, party names, dates, jurisdiction, etc.).
4. **Present the completed document** with all `<mark>` fields filled in. Strip the `<mark>` tags — they are formatting artifacts for the LLM, not part of the final document.
5. **Flag non-standard situations** — HIPAA applicability, GDPR jurisdiction, equity terms, arbitration clauses — and recommend the user have counsel review before signing.

## Selection rules

- **Both parties sharing info** → Mutual NDA
- **Only you sharing info** → One-Way NDA
- **User base in EU/UK** → Privacy Policy (GDPR) + DPA (Global)
- **U.S.-only product** → Privacy Policy (U.S.) + DPA (U.S.) if needed
- **Handling health data** → BAA (required by HIPAA)
- **Vendor/contractor engagement** → MSA
- **Early advisor with equity** → Advisor Agreement
- **Hiring in California** → Employee Offer Letter

## Important disclaimer

These are template starting points, not legal advice. Recommend the user have an attorney review the completed document before execution, especially for equity terms, HIPAA/GDPR compliance, and cross-border agreements.
