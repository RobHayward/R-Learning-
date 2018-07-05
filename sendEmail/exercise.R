# Rmail
library(mailR)
send.mail(from = Sys.getenv("Sender"), 
          to = Sys.getenv("recepient"), 
          body = "Hellow World. This is my email!", 
          htlm = TRUE, 
          inline = FALSE, 
          smtp = list(host.name = Sys.getenv("smpt_server"), 
                      port = 25), 
          autenticate = FALSE, 
          send = TRUE)
          