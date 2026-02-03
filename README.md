# Oncall Scheduling

## Overview

This is mostly a repurposing of stuff that Jacob put together for scheduling oncall shifts. I've tried to make this a bit easier for myself over time, please feel free to edit/change this as you see fit to make your life better!

## Usage

1. Edit `oncall_scheduler.rb:8` to set `start_date`
    1. This should be an argument passed in at some point instead, PRs welcome
1. Update the `names` list
    1. The roster changes every quarter: People on leave, new people being added, others leaving, etc
    1. We add people typically 90-120 days after they join the company and are ramped up
    1. It's important to have an even number of people, otherwise the pairings break down
1. Run the script `ruby oncall_scheduler.rb 1`
    1. The `1` here is number of iterations. 1 iteration covers a quarter currently, so that's all I use
    1. We could probably default this as well, PRs welcome
1. Analyze the schedule that comes out, now the real work begins

## Mark's Flow

(This section should go away someday, this is just how Mark Rogers used it to make the last 3-4 schedules.)

1. Create a working space, e.g. `mkdir jan_26_scheduling`
1. Run the script `ruby oncall_scheduler.rb 1 > jan_26_scheduling/schedule_output.txt`
1. I typically ran this 5-6 times until the shuffle gave me results that were close enough to work with, aiming for:
    1. New oncall engineers paired with established engineers. New people on the Secondary Weekday Shift, established on the Primary. This sets the new engineer up for success on the Primary Weekend shift
    1. If they were oncall primary last cycle, I try to aim for them to be oncall secondary in the next cycle
    1. Check against PTO and schedules
    1. I talk to Claude about this part of it A LOT. I give it the last schedule, the current schedule and discuss it a lot to get to something that feels close enough
1. Run the schedule printer: `./schedule_printer.sh` which should give you a format that's a bit easier to read and work with. Makes it way easier to paste into Sheets, and share with eng.
1. Fill in the [Eng Oncall Schedule Sheet](https://docs.google.com/spreadsheets/d/1lefjmVG4Asqpm7ho2Mi7zUcAd18ZU1aosR4VToUpBr8/edit?gid=595839896#gid=595839896)
1. DM all the engineers and manually confirm all of the schedules
1. Inevitably make some swaps that you'll need to coordinate across multiple people
1. Inform all the DMs
1. Manually place all the overrides in the following PD schedules:
    1. [Primary Weekday](https://givecampus.pagerduty.com/schedules/PXWREOT)
    1. [Primary Weekend](https://givecampus.pagerduty.com/schedules/PZ479HA)
    1. [Secondary Weekday](https://givecampus.pagerduty.com/schedules/PKAZV0F)
    1. [Secondary Weekend](https://givecampus.pagerduty.com/schedules/P2AAH7D)
1. Celebrate!