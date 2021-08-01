# Incident Responder Certification

Course: https://premiumpdu.pagerduty.com/incident-responder-certification-fastrack/852874

### Introduction of Incident Response

* An incident is any **unplanned** disruption or degradation event that is actively customers' ability to use the product
  * It is acceptable if your company's definition is different as long as you have one and it is respected internally
  * Not all failures are an incident if they are within the expected rate of error

* Incident Response - __It is not about solving the problem, it is a way to hanndle the situation to limit damage and reduce recovery time/costs!__

### History

The incident command system (ICS)

* A inter-agency group created on firefighters that eventually became the national respopnse system for the US-goverment.
* ICS is mainly a framework, it tries to provide minimum recommendations
  * It has been modified to use differently on different places to attend specific needs
* PagerDuty is based on ICS

### Definitions

* Incident - An incident is any **unplanned** disruption or degradation event that is actively customers' ability to use the product
  * Severity: a typo in the docs that says the customer SHOULD do something that they actually SHOULD NOT, the question is, how bad is this incident
    * Minor
      * Not urgent
      * A known failure mode, with a fix that might be also known
      * Within the responsibilities of a small group/team
    * Major
      * Any incident that requires a coordinated response from multiple teams It should be defined internally and there should not be disagreements of what is or not major DURING the incident
      * A metric can be useful for defining such incidents, e.g.: error rates of >= 10% for at least 15 min?
      * Commonalities:
        * Timing is a surprise - If you would've known it wouldn't be an incident
        * Time Matters - Need to respond quickly, that being for UX or monetary incentives
        * Situation is rarely understood at the start of the incident - Most likely overseen issues for a person or a group
        * Requires coordination - Requires to mobilize a cross-functional team to coordinate the resolution

### People Roles

### Incident Categorization

* It is important to establish/define the severity or level of an incident and that this is commong for everyone participating

e.g.:
* SEV1 - Critical issue that warrants public notification and liaison with executive teams
  * The system is is a critical staate and actively impacting a large group of customers (TODO: Define the size of customer to be considered SEV1)
  * Functionality impaired for a long time, breaking SLA (TODO: Define the SLO/SLAs )
  * Customer-dataa exposured, security vulnerability
  * Major Incident Response
* SEV2 - Critical system issue actively impacting customers' ability to use the product
  * Major / essential feature is severely impaired (e.g.: pagerduty example: notification pipeline, incident response ack/resolve,...)
  * Major Incident Response
* SEV3 - Lack of Stability or minor impacting issue that require immediate attention
  * Likely to become SEV2 if nothing is done
  * No redundancy (failure of 1 node can cause an outage)
  * High-urgency Page
* SEV4 - Minor issue requiring action but not affecting the customer use of the product
  * Performance issue (delays, longer page time loads)
  * Individual host failure (node out of the cluster)
  * Delayed jobs (not impacitng the customer)
  * Cron failure (not impacting the customer)
  * Low-Urgency Page
* SEV5 - Cosmetic issue, bugs, not affecting the customer ability to use the core product
  * Maybe it is a ticket not an On Call Incident
  * No page

### Being Prepared for Incidents

#### Triggering Incidents

Anyone is able to trigger the Incident Response Process at any time

e.g.: support team detects many cases for similar issue that could be slipping through the monitoring system

Although the focus is automated systems so that the response time between an incident is detected and triggered is minimized.

#### Mentality Shift

Moving from day-to-day operations to emergency

Things that are not accepted/okay during day-to-day might be required during emergency, e.g.: writing code without tests

It is important to know when to shift, using metrics is a way to break-down such, e.g.: number of orders per second, ...

Having the severity specified will facilitate understanding which actions are or become acceptable

#### During an Incident

* Hierachy, clear order, work fast - Everyone should know works should work fast
* The resolution team has the authority - Final decisions or important ones, should be agreed with such team
* Team works together to resolve the issue - With documentation an stakeholders notified
* Emergency mode - It remains in place until the incident is resolved


*** Decision Paralysis ***

Teams should have the ability of making decisions but they should focus on acting and getting things done

#### Response Team Goals

* Resolve the Incident Quickly - Making things operational again
* Resolve the Incident Efficiently - Making sure roles, hierarchy are followed an that the process is working at its best
* Document decisions and follow-up items - What happened? Why? How to avoid that incident in the future?
* Keep stakeholders informed - Incident impact business, e.g.: support, PR, marketing,... for messaging
* Stay in wartime until incident is resolved - Not to be distracted by day-to-day activities that are not urgent, fix should be verified to work

### Response Layers / Roles

* Command
  * Incident Commander
    * Single Source of reference
    * Coordinating and delegating but not really acting on incident
    * IC should act on resolving and if they come to that they should hand-over the role
  * Deputy
    * Not a shadow
    * Expected to perform important tasks
    * Right hand person to the IC
    * Follow-up / reminders
    * Act as a hot stand-by in case IC needs to jump into an SME
  * Scribe
    * Documents the timeline
    * Record keeper, adding additional context
    * The log will be used during post-mortem to identity efficiency and TODOs for product / infra roadmaps
    * Remind the IC to follow-up on tasks
* Communication
  * Internal Liaison - Link to the internal stakeholders
  * Customer Liaison - Link to the customer
    * Crafting messages to customers with company core messaging
    * Customer support training
* Operations
  * SME - Subject Matter Expert

*** Workflow ***

* Ask for status - Understand what is presented
* Decide Action / Gain Consensus - How are we going to respond? Is there an agreement across the deciders
* Assign Task - Someone acts on it
* Follow-up on Task Completion - Confirm the action is complete, go to 1

*** Communication ***

* Incident Commander - Introduce themselves and asks everybody else to do the same
* If not incident commander is present raise the issue up
* When taking the call optimize decision consensus to exception: "Does anyone disagree?", "Is there anyone with strong objections?"

#### 4 steps of an incident

```
Triage > Mobilize > Resolve > Prevent
  |         |         |         |
  |         |         |         |> Post Mortem
  |         |         |
  |         |         |> Incident Responding
  |         |
  |         |> Who is doing what?
  |
  |> What is the severity?
````

*** How does one prepare to be an incident commander? ***

* Ensure explicit process and expectations - Major incident? Minor?
2. Setup Runbooks & Automated Actions - Who is available when?
3. Find ways to create more space for the team to work - Improve and review process with feedback from learnings
4. Make Checklists - Regardless of exp, we can all error - The Checklist Manifesto (Book)
5. Practice Running Major Incidents - Incident Fridays, controlled experiments

*** Pitfalls ***
* C-level takeover - "Do you wish to take command?"
* "Let's try to resolve this in 10min" - We are in the middle of an incident, please keep comments until the end
* "Can I get a spreadsheet of all affected customers?" - We can either get you that list or fix that incident
* "Is this really a SEV1" - Always assume is the highest and learn later from the post-mortem
* Notify stakeholders - Make sure people are aware, otherwise they will be pinging you and distracting from the incident
* Get everyone on the call - Not helpful, not a good use of time... better to have the right people at the right time
* Being overly focused on an issue - keep the bigger picture in mind
* Requiring deeply technical knowleddge - It should be team agnostic, coordination of response rather than solving the technical details
* Belligerent Responders - Big opniions, ego, chaos... be firm, "You are being disruptive to the team, I might have to remove you if you continue"
* Hand-offs/overs are encouraged - At the discretions of people envolved as people get tired

## Postmortem

> What is a Postmortem?

A session to review what went wrong and how do we learn from it.

* Blame free analysis soon after the event
* Postmortems could be referred as After-Action Review, Post-Incident Review, Incident Report...
* Feedback/analysis of the incident response process
* During the incident the team is focused on restoring the service, not optimal quality/performance/best practices.

> When to do run a Postmortem?

Every time there is an incident, even that the root cause or side-effects were not as severe as initially thought.

They should be ran shortly after the incident, a few business days.

> Who is responsible for the postmortem?

The IC should nominate a person to be the postmortem owner, but that person should be only the coordinator not the sole worker.

The owner could be someone that took leadership during the incident, performed a task to stabilize or even the person that triggered/was in the oncall scheduled.

### Goals

The goal of the Postmortem is to understand systemic factors leading to the inccident and identify actions htat cacn improve relisiency of the afeccted systems.

How the mistake was made? instead of Who made it?

### Analysing Failure

Ask why a reasonable, rational and decent person may have taken a particular action that caused an incident

Ask what? and how?, avoid who? and why?

### The Report

* Have a template in-place
* Go to history on Slack/G-Docs/
* Identify the responders and add them to the document so they can help you
* Add a link to the incident call if recorded
* Schedule a meeting (30min-1h)
* Analysing the incident itself
* The incident might have started before you recognized it
* Create a timeline
* Include information the team didn't necessarily know at the time
* Include metrics and charts / screenshots (Link monitoring)
* Maybe customer data
* Stick to facts
* Include changes to the status of the incident
* Include actions taken by respondders
* Document the impact:
  * How long was the impact visible?
  * How many customers were affected?
  * What functionality was affected?

#### Helpful Questions

* Was the incident isolated or part of something bigger, like a trend?
* Will it get worse over time if we don't do anything?
* How do we prevent from happening?

#### Follow-up

* Do we need to improve monitoring to detect it faster?
* How do we better predict the severity of the incident?
* Find TODO itetms raised during the incident to review and create tickets
* Define items clearly to understand what is on scope or not on scope

Examples:


* Actionalble:
  * Bad - "Investigate monitoring for this"
  * Good - "Add alerting for all cases where service return >1% errors for 10min"
* Specific:
  * Bad - Fix issues that caused the error
  * Good - Handle invalid postal codes with a graceful error message
* Bounded:
  * Bad - Make sure engineers checks database schema before migration
  * Good - Add an automated hook for schema changes
    * Doesn't depend on people, there is a mechanism


#### External Messaging

How to communicate to customers?

* Summary - Two or three sentences
* What happened - what was the incident, what was the duration/impact
* Actions - What are we doing to prevent it from happening again

#### Postmortem Meeting

* Main outcome: buy-in for action plan
* Participants:
  * Incident Commander
  * Service Owners
  * Product/Project Managers/Owners
  * Shadow, Scribe, Liaisons...
  * Engineering Managers
  * Higher Leadership (Head/Director) when such incidents are organizationally deep

# Q&A

* <details><summary>What is the goal of ICS?</summary>
     <p> Handle the sitation in a way that limits damage and reduces recoveru time </p>
    </details>
* <details><summary>What is a minor incident?</summary>
     <p> Not urgent, might be a known failure, small team responsibilities </p>
   </details>
* <details><summary>When to use the ICS?</summary>
     <p>  When you are managing a major incident </p>
   </details>
* <details><summary>Why should people be able to trigger a major incident manually?</summary>
     <p> Because systems are not always 100% correct and people should be able to pull the plug</p>
     <p> Lowering the barrier to which incidents are created/detected increases resolution speed</p>
  </details>
* <details><summary>Who is in charge of all responder actions during an incident?</summary>
     <p> Incident Commander </p>
   </details>
* <details><summary>If the CEO asks a responder to do something during an incident what should they do?</summary>
     <p> Deffer to the incident commander, who is in charge</p>
   </details>
* <details><summary>How does ICS help SMEs during a major incident?</summary>
     <p> By creating a protection/focus buffer so that they can focus on executing tasks and providing status updates </p>
     <p> That avoid chaos and (more) stress </p>
   </details>
* <details><summary>What is the main job of an Incident Commander?</summary>
     <p>To keep incident process moving along</p>
   </details>
* <details><summary>Why the Incident commander should avoid using acronyms? </summary>
     <p>To avoid ambiguity</p>
   </details>
* <details><summary>What is the most useful frase an Incident Command should use to seek consensus?</summary>
     <p> Are there any strong objections?</p>
   </details>
* <details><summary>What should the incident commander say instead of "Can someone...?"</summary>
     <p> Assign clear tasks to specific people, get acknowledgement and a timebox</p>
   </details>
* <details><summary>What is the purpose of having a scribe?</summary>
     <p> Having the Incident Commander and SMEs focused on their tasks while everything is documented for learning/efficiency, with context</p>
   </details>
* <details><summary>How often do we send uppdates to stakeholders</summary>
     <p> Every 20-30 min </p>
   </details>
* <details><summary>Most useful phrase to defuse executives with conflicting orders?</summary>
     <p> Would you like to take command? </p>
   </details>
* <details><summary>Where can you find more </summary>
     <p> Do you want to take command? </p>
   </details>
