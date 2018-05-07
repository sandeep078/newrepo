resource "aws_instance" "tomcat" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "${aws_security_group.wp_sg.id}" ]
  key_name = "${aws_key_pair.mykey.key_name}"
  subnet_id       = "${aws_subnet.wp_public1_subnet.id}" 

   provisioner "local-exec" {
     command = "sleep 30 && echo \"[tomcat-servers]\n${aws_instance.tomcat.public_ip} ansible_connection=ssh ansible_ssh_user=ec2-user ansible_ssh_private_key_file=mykey host_key_checking=False\" > tomcat-inventory &&  ansible-playbook -i tomcat-inventory ansible-playbooks/tomcat-site.yml "
  }

  connection {
    user = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}
output "tomcat_ip" {
    value = "${aws_instance.tomcat.public_ip}"
}
output "tomcat_END_URL" {
    value = "http://${aws_instance.tomcat.public_ip}:8080"
}

