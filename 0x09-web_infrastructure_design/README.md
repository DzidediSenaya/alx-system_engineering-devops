Task 0
Infrastructure Overview:

Server: A server is a physical or virtual machine that hosts resources and services, serving requests from clients over a network. In this case, it's the machine that manages all components of your web application stack.

Domain Name: The domain name (e.g., foobar.com) is a human-readable address that corresponds to an IP address (e.g., 8.8.8.8). It's used to access websites instead of remembering numerical IP addresses.

DNS Record (www): The www record is a type of DNS record called a "CNAME" (Canonical Name) that points the subdomain "www" to the main domain (e.g., foobar.com). This makes it possible to access the website using both "foobar.com" and "www.foobar.com."

Web Server (Nginx): The web server handles incoming HTTP requests and serves static files (like HTML, CSS, and images) to clients. It can also act as a reverse proxy, forwarding requests to the application server.

Application Server: The application server processes dynamic content, executes business logic, and communicates with the database. It generates the necessary data for the web server to serve to clients.

Application Files (Code Base): These are the files containing your application's source code, including the logic for handling user requests and generating responses.

Database (MySQL): The database stores structured data, such as user information, posts, or product details. It can be queried by the application server to retrieve or update information as needed.

Communication Flow:

When a user requests the website by typing "www.foobar.com" in their browser:

The DNS system resolves the domain name to the IP address (8.8.8.8 in this case).
The request is sent to the web server (Nginx) at that IP.
The web server processes the request, serves static files if needed, and forwards dynamic requests to the application server.
The application server processes the request, interacts with the database if necessary, generates a response, and sends it back to the web server.
The web server then sends the response to the user's browser, which displays the web page.



Task 1
Infrastructure Overview
Server 1: Hosting the web server (Nginx), application server, and load balancer (HAproxy).
Server 2: Hosting the application server and database replica (MySQL).
Web Server (Nginx): Handles incoming HTTP requests, serves static files, and forwards dynamic requests to the application server.
Application Server: Processes dynamic content and communicates with the database to generate responses.
Load Balancer (HAproxy): Distributes incoming traffic across multiple application servers, improving performance and reliability.
Set of Application Files (Code Base): Contains the source code for your application.
Database (MySQL): Stores structured data.
Why Additional Elements:

Server 2: Added for redundancy and to host a database replica.
Load Balancer: Added to distribute traffic across multiple application servers for better performance and high availability.
Load Balancer Distribution Algorithm:

The load balancer (HAproxy) is configured with a Round Robin distribution algorithm. This algorithm sends requests to each server in a rotating manner, distributing the load evenly among the available servers.
Active-Active vs. Active-Passive:

The setup is Active-Active. Both application servers are actively serving traffic, sharing the load. In an Active-Passive setup, one server would be active while the other is on standby (passive) until a failover event occurs.
Database Primary-Replica Cluster:

In a Primary-Replica (Master-Slave) cluster, the Primary node (Master) is responsible for handling write operations (INSERT, UPDATE, DELETE), while the Replica node (Slave) replicates these changes from the Primary node and serves read operations.
Difference between Primary and Replica in Regards to the Application:

The Primary node handles write operations and is the source of truth for the data. The application should send write queries to the Primary node to ensure data consistency. The Replica node(s) can handle read queries, offloading the read traffic from the Primary and improving overall performance.


Task 2
Web Infrastructure overview
Server 1: Hosting the web server (Nginx), application server, load balancer (HAproxy), and monitoring client.
Server 2: Hosting the application server, database replica (MySQL), and monitoring client.
Server 3: Hosting the database replica (MySQL) and monitoring client.
Firewall 1, 2, and 3: Providing network security by filtering and controlling incoming and outgoing traffic.
SSL Certificate: Used to enable HTTPS, ensuring secure data transmission.
Monitoring Clients: Collect data from various components for monitoring and analysis.
Why Additional Elements:

Firewalls: Added for network security to control and filter traffic.
SSL Certificate: Added to encrypt data transmitted between clients and the server.
Monitoring Clients: Added to collect performance and operational data for analysis.
Firewalls:

Firewalls are added to protect the infrastructure from unauthorized access, malware, and attacks. They act as a barrier between the server and the external network, controlling the flow of incoming and outgoing traffic based on predefined security rules.
HTTPS:

Serving traffic over HTTPS ensures encrypted communication between clients and the server. This is essential for securing sensitive data (such as login credentials, payment information, etc.) during transmission, preventing eavesdropping and data tampering.
Monitoring:

Monitoring is used to track the health, performance, and availability of different components in the infrastructure. It helps detect issues early, optimize performance, and ensure efficient resource utilization.
Data Collection for Monitoring:

Monitoring clients (data collectors) gather various metrics and logs from the servers, application, and database. These metrics might include server CPU usage, memory usage, network traffic, database query performance, etc.
Monitoring Web Server QPS:

To monitor the web server's Queries Per Second (QPS), set up the monitoring tool to collect data on the number of incoming requests to the web server. This data can then be visualized and analyzed to understand traffic patterns and potential performance bottlenecks.


Task 3

Infrastructure Overview 

Server 4: Hosting the web server (Nginx), application server, and database.
Cluster Configuration:

Load Balancer Cluster: The two HAproxy load balancers (Load Balancer 1 and Load Balancer 2) are configured in a cluster for high availability and load distribution.
Split Components:

Server 1: Hosting Load Balancer 1 and Monitoring Client 1.
Server 2: Hosting Application Server 1 and Monitoring Client 2.
Server 3: Hosting Database 1 (Primary) and Monitoring Client 3.
Server 4: Hosting Web Server, Application Server, and Database 2 (Replica).
Why Additional Elements:

Server 4: Added for better separation of components (web server, application server, and database), optimizing resource allocation and improving scalability.
Cluster Configuration:

Load Balancer Cluster: By configuring the load balancers in a cluster, you ensure high availability. If one load balancer fails, the other can seamlessly take over, ensuring uninterrupted service.
Split Components:

Server Separation: Splitting components onto dedicated servers enhances security, isolation, and resource utilization. It also allows for easier scaling and maintenance of individual components.
