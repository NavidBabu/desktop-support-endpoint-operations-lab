# Desktop Support Troubleshooting Runbook

## 1. Confirm the problem
Capture the user, device, location, time issue began, exact symptoms, business impact, and whether one or multiple users are affected.

## 2. Basic endpoint checks
- Confirm power, cabling, dock, monitor, and peripherals
- Check free disk space and memory pressure
- Confirm OS status and recent updates
- Reproduce the issue where possible
- Review Event Viewer for relevant errors

## 3. Network checks
1. Run `ipconfig /all`
2. Confirm IP, subnet mask, default gateway, and DNS servers
3. Ping loopback: `ping 127.0.0.1`
4. Ping default gateway
5. Ping a known server or external IP
6. Test DNS with `nslookup`
7. Use `tracert` if the path needs investigation

## 4. Authentication / domain checks
- Confirm credentials and account status
- Verify domain-joined state if required
- Confirm date/time synchronization
- Check group membership / permissions
- Escalate identity or Active Directory issues with evidence

## 5. Application checks
- Confirm application version
- Determine whether one or many users are affected
- Restart application / workstation where appropriate
- Review logs and error codes
- Validate network, database, VPN, or drive dependencies

## 6. Change / patch review
Check whether the problem began after:
- Windows update
- driver update
- software deployment
- configuration change
- network change

## 7. Escalation package
Provide issue summary, affected user/device, troubleshooting completed, screenshots/error codes, network test results, event-log evidence, recent changes, and business impact.

## 8. Fix validation
- Reproduce the original workflow
- Confirm network and application access
- Verify with the end user
- Document root cause and resolution
- Update knowledge base if reusable
