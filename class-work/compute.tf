resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.web.id]
  associate_public_ip_address = true

  user_data = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx

    cat > /var/www/html/index.html <<'HTML'
    <!doctype html>
    <html>
    <head><title>EI Terraform Lab</title></head>
    <body>
      <h1>EI Technologies - Terraform Change applied to this config!</h1>
      <p>This Ubuntu EC2 server was provisioned with Terraform.</p>
      <p>Week 8 real-world Infrastructure as Code practical.</p>
    </body>
    </html>
    HTML

    systemctl enable nginx
    systemctl restart nginx
  EOF

  tags = {
    Name = "${var.project_name}-web"
  }
}