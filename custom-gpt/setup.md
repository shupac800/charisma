# Custom GPT Setup Guide

Create a ChatGPT Custom GPT that scores characters on D&D mental ability scores and writes to the shared database.

## Step 1: Create the GPT

1. Go to [chat.openai.com](https://chat.openai.com) > Explore GPTs > Create
2. Name: **Charisma** (or whatever you like)
3. Description: *Score any person — real or fictional — on D&D's three mental ability scores (Charisma, Intelligence, Wisdom) with class and subclass assignment.*

## Step 2: Paste Instructions

Copy the entire contents of `instructions.md` into the **Instructions** field.

## Step 3: Configure Actions

1. Click **Create new action**
2. Set **Authentication** to **API Key**
   - Auth type: API Key
   - API Key: `sb_publishable_212NlyiesTnUTU6BP7qSWw_1Pog5wTE`
   - Header name: `apikey`
3. Paste the contents of `openapi.yaml` into the **Schema** field
4. Set **Privacy policy**: leave blank or link to your repo

## Step 4: Configure

- **Web Browsing**: Enable (for researching obscure fictional characters)
- **Code Interpreter**: Not needed
- **DALL-E**: Not needed

## Step 5: Test

Type "Score Gandalf" and verify it:
1. Produces CHA, INT, WIS scores with reasoning
2. Assigns a class and subclass
3. Queries the database for similar characters
4. Offers to save to the database
5. The `scored_by` field should read something like `ChatGPT/GPT-4o`

## Notes

- The GPT uses the same shared Supabase database as the Claude Code skill
- The `scored_by` field tracks which AI model produced the assessment
- Only fictional characters and public figures can be uploaded — the GPT should refuse private citizens
- The API key is a publishable/anon key scoped by Row Level Security — safe to include in the GPT config
