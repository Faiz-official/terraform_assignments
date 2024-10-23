m_ami_id                = "ami-04a37924ffe27da53" # Provided by you (Amazon Linux 2 AMI in ap-south-1)
m_instance_type         = "t2.micro"              # Low-cost instance type suitable for small workloads
m_db_instance_class     = "db.t3.micro"           # A cost-effective instance class for RDS
m_db_username           = "admin"                 # Set your DB username (adjust as necessary)
m_db_password           = "strongpassword123"     # Use a strong password (adjust accordingly)
m_vpc_cidr              = "10.0.0.0/16"           # Default VPC CIDR range, adjust as necessary
m_public_subnet_cidr    = "10.0.1.0/24"           # Public subnet CIDR block
m_private_subnet_cidr_1 = "10.0.2.0/24"           # First private subnet CIDR block
m_private_subnet_cidr_2 = "10.0.3.0/24"           # Second private subnet CIDR block


