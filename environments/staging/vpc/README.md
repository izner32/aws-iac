# VPC Network Design
![VPC Network Design](./diagrams/vpc-design.drawio.png)

# VPC Network Best Practices 
### Architecting
* Up to four Availability Zones for high availability and disaster recovery. (AWS recommends maximizing your use of Availability Zones to isolate a data center outage.) Availability Zones are geographically distributed within a region and spaced for best insulation and stability in the event of a natural disaster.

* Separate subnets for unique routing requirements. AWS recommends using public subnets for external-facing resources and private subnets for internal resources. For each Availability Zone, this Quick Start provisions one public subnet and one private subnet by default. (If you need public subnets only, you can disable the creation of the private subnets.) For subnet sizing strategies, see the next section.

* Additional layer of security. AWS recommends using network ACLs as firewalls to control inbound and outbound traffic at the subnet level. This Quick Start provides an option to create a network ACL protected subnet in each Availability Zone. These network ACLs provide individual controls that you can customize as a second layer of defense.

* We recommend that you use network ACLs sparingly for the following reasons: they can be complex to manage, they are stateless, every IP address must be explicitly opened in each (inbound/outbound) direction, and they affect a complete subnet. We recommend that you use security groups more often than network ACLs, and create and apply these based on a schema that works for your organization. Some examples are server roles and application roles. For more information about security groups and network ACLs, see the Security section later in this guide.

* Independent routing tables configured for every private subnet to control the flow of traffic within and outside the Amazon VPC. The public subnets share a single routing table, because they all use the same Internet gateway as the sole route to communicate with the Internet.

* Highly available NAT gateways, where supported, instead of NAT instances. NAT gateways offer major advantages in terms of deployment, availability, and maintenance. For more information see the comparison provided in the Amazon VPC documentation.

* Spare capacity for additional subnets, to support your environment as it grows or changes over time.

### Security 
* When you add subnets to your VPC to host your application, create them in multiple Availability Zones. An Availability Zone is one or more discrete data centers with redundant power, networking, and connectivity in an AWS Region. Using multiple Availability Zones makes your production applications highly available, fault tolerant, and scalable. For more information, see Building a Modular and Scalable Virtual Network Architecture with Amazon VPC.

* Use network ACLs to control access to your subnets and use security groups to control traffic to EC2 instances in your subnets. For more information, see Control traffic to subnets using Network ACLs and Control traffic to resources using security groups.

* Manage access to AWS VPC resources and APIs using AWS Identity and Access Management (IAM) identity federation, users, and roles. For more information, see Identity and access management for Amazon VPC.

* Use Amazon CloudWatch with VPC flow logs to monitor the IP traffic going to and from network interfaces in your VPC. For more information, see Publish flow logs to CloudWatch Logs.

### Additionals
* https://medium.com/aws-activate-startup-blog/practical-vpc-design-8412e1a18dcc