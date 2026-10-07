import csv
from collections import Counter

with open("simulated_support_tickets.csv", newline="") as f:
    rows = list(csv.DictReader(f))

resolved = [r for r in rows if r["status"] == "Resolved"]
resolution_times = [int(r["resolution_minutes"]) for r in resolved if int(r["resolution_minutes"]) > 0]

print("Total tickets:", len(rows))
print("Resolved:", len(resolved))
print("Resolution rate:", round(len(resolved)/len(rows)*100, 1), "%")
print("Average resolution time:", round(sum(resolution_times)/len(resolution_times), 1), "minutes")

print("\nTickets by category:")
for k,v in Counter(r["category"] for r in rows).most_common():
    print(" ", k, v)

print("\nTickets by root cause:")
for k,v in Counter(r["root_cause"] for r in rows).most_common():
    print(" ", k, v)
