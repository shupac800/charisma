# Charisma: D&D Mental Ability Score Assessor

Score any person — real or fictional — on D&D's three mental ability scores (Charisma, Intelligence, Wisdom) with detailed reasoning, class/subclass assignment, and a shared database of scored characters.

Based on the scoring framework from [AJ Pickett's "The Complete Guide to Charisma"](https://www.youtube.com/@ajpickett).

## What It Does

Give it a name or description. It returns:

- **Charisma (3-30)**: Presence, force of self, the quality that exists between you and your audience
- **Intelligence (3-30)**: Analytical power, reasoning, pattern recognition
- **Wisdom (3-30)**: Perception, judgment, self-awareness, impulse control
- **Class & Subclass**: Based on how the person moves through the world
- **Stat Interaction Analysis**: How the three scores produce this person's specific archetype
- **Similar Characters**: The 8 most statistically similar entries in the shared database

Scores are grounded in specific heuristics — not vibes. Each score maps to a concrete description of what that number means for how a person moves through social space, solves problems, and perceives the world.

## Calibration

The natural human range is 3-18. An 18 is the absolute peak of human potential — legendary, one-in-an-era. Scores above 18 are reserved for mythological, divine, or magically enhanced beings.

| Range | Meaning |
|-------|---------|
| 3-5 | Severely impaired |
| 6-7 | Poor |
| 8-9 | Below average |
| 10-11 | Human average |
| 12-13 | Above average |
| 14-15 | Impressive (top 5-10%) |
| 16 | Exceptional (top 1%) |
| 17 | Extraordinary (generational) |
| 18 | Legendary (historical peak) |
| 19-20 | Beyond natural limits |
| 21+ | Supernatural only |

## Use It

### Option 1: Claude Code (slash command)

Clone this repo, `cd` into it, and type `/charisma` in Claude Code:

```bash
git clone https://github.com/shupac800/charisma.git
cd charisma
claude
# then type: /charisma
```

### Option 2: Custom GPT (ChatGPT)

A Custom GPT version is available that uses the same scoring framework and writes to the same shared database. See `custom-gpt/` for setup instructions.

### Option 3: Any LLM

The scoring framework is in `.claude/skills/charisma.md`. You can paste it as a system prompt into any LLM. Database integration requires API access (see below).

## Shared Database

All scored characters live in a shared Supabase database. The database:

- Stores scores, reasoning, class, and which AI model produced the assessment
- Allows similarity search (Euclidean distance across CHA/INT/WIS)
- Only accepts **fictional characters** and **public figures** — no private citizens
- Is publicly readable

### Schema

See `supabase_setup.sql` for the full table definition.

### API Access

Read (no auth beyond the publishable key):
```
GET https://wuiolpbccipaenvzbcdw.supabase.co/rest/v1/characters?select=*
Header: apikey: sb_publishable_212NlyiesTnUTU6BP7qSWw_1Pog5wTE
```

## Project Structure

```
charisma/
  .claude/skills/charisma.md   # The skill (Claude Code slash command)
  custom-gpt/
    instructions.md            # System prompt for ChatGPT Custom GPT
    openapi.yaml               # API schema for Custom GPT Actions
    setup.md                   # Step-by-step Custom GPT creation guide
  supabase_setup.sql           # Database schema
  README.md
```

## License

MIT
