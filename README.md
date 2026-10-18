# ShiftPay Pro website

Production-ready static marketing site for GitHub Pages. Public copy is written in natural American English for U.S. shift workers.

## Included

- Product landing page focused on shift planning, gross-pay estimation, paycheck checking, overtime, and shift differentials.
- An evergreen shift-pay guide for non-brand search queries.
- SoftwareApplication/MobileApplication, Organization, WebSite, FAQPage, and Article JSON-LD.
- Canonicals, social cards, sitemap, robots.txt, semantic HTML, internal links, responsive design, dark mode, and accessibility basics.
- Privacy and terms placeholders that must be reconciled with the released app and Play Console declarations.

## Required configuration

Do not publish with placeholders. From the repository folder, run:

```bash
./setup-site.sh
```

Enter your GitHub username, repository name, exact production Google Play URL, real support email, and optional custom domain.

Then review:

- `privacy.html`: replace the visible warning and placeholder copy with the exact approved policy. It must match the app, active third-party SDKs, and Play Console Data safety declaration.
- `terms.html`: replace the visible warning and placeholder terms with finalized terms.
- `version` in `_config.yml` whenever the public app version changes.
- Never add ratings, user counts, awards, price, savings claims, or testimonials unless current and verifiable.

## Publish on GitHub Pages

1. Create a public GitHub repository, preferably named `shiftpay-pro`.
2. Upload every file in this folder to the repository root.
3. Open **Settings → Pages**.
4. Under **Build and deployment**, select **Deploy from a branch**.
5. Select `main` and `/ (root)`, then save.
6. Open the published URL when deployment finishes.
7. Enable **Enforce HTTPS**.

## Custom domain

A custom domain is recommended for brand identity and stable citations.

1. Add it in **Settings → Pages → Custom domain** before changing DNS.
2. For `www`, create a CNAME pointing to `YOUR-GITHUB-USERNAME.github.io`, not the repository path.
3. For an apex domain, follow GitHub's current A/ALIAS/ANAME instructions.
4. Verify the domain in GitHub to reduce takeover risk.
5. Enable HTTPS after DNS resolves.
6. Use one canonical domain and redirect alternate variants.

## Validate before launch

- Open every navigation link and CTA on desktop and at 375px width.
- Confirm that the production Google Play listing and support email work.
- Confirm no unresolved placeholders remain:

```bash
grep -R --exclude='setup-site.sh' --exclude='README.md' -E 'YOUR-|example\.com' .
```

- Check JavaScript syntax with `node --check assets/site.js`.
- Test the home page with Google's Rich Results Test.
- Test deployed URLs with Search Console URL Inspection.
- Check title, description, canonical, social image, 404 page, robots.txt, and sitemap.xml.
- Run Lighthouse for mobile Performance, Accessibility, Best Practices, and SEO.

## Google indexing

1. Create a Google Search Console property; use a Domain property if you own the domain.
2. Verify ownership.
3. Submit `https://YOUR-DOMAIN/sitemap.xml`.
4. Inspect the home page and shift-pay guide, then request indexing.
5. Monitor Pages, Sitemaps, Core Web Vitals, and search performance.

## Bing and AI discovery

1. Add the site to Bing Webmaster Tools and verify it.
2. Submit the sitemap and use URL submission after launch and major updates.
3. Consider IndexNow later if content changes frequently.
4. Keep normal search crawlers allowed unless you deliberately choose otherwise.

Do not expect `llms.txt` or a hidden keyword list to force AI recommendations. Crawlability, accurate visible text, matching structured data, independent mentions, and useful content matter more.

## First SEO content backlog

Publish one strong page every 1–2 weeks, based on a real user question and Search Console evidence:

1. How to Calculate a 12-Hour Shift With a 30-Minute Unpaid Break
2. Night Shift Differential: Fixed Amount vs Percentage
3. Gross Pay vs Net Pay for Hourly Shift Workers
4. How to Review Overtime Hours Before Payday
5. 3×12 Schedule: Hours, Overtime, and Pay-Period Checks

Each page should answer the query immediately, use a clearly fictional example, explain assumptions, link to the product and a related guide, avoid legal conclusions, and include Article JSON-LD plus unique metadata.

## Measure the funnel

Website SEO matters only if it produces activated users, not just impressions. Use privacy-safe aggregate measurement and never send wage, rate, employer name, shift dates, notes, paystubs, or discrepancy amounts.

Track weekly:

- Search impressions and clicks by query and page.
- Google Play CTA clicks by page and campaign.
- Store visitors and acquisitions attributable to the website.
- First estimate rate and completed paycheck checks.
- Purchases, CAC when applicable, and next-pay-period retention.

Campaign URLs may use public UTM values such as:

```text
?utm_source=shiftpaypro_site&utm_medium=organic&utm_campaign=homepage
```

Never place personal or financial information in URLs.

## No guarantee

Publishing this site does not guarantee first-page rankings or recommendations by ChatGPT, Perplexity, Google AI, Bing Copilot, or another assistant. A new domain has no earned authority, independent reviews, links, or engagement history. Use the site as discoverability infrastructure, then build evidence with useful content, a strong Play listing, legitimate reviews, relevant citations, and links.
