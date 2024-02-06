[servers]
%{ for host in hosts ~}
${host.name} ansible_host=${host.ip}
%{ endfor ~}