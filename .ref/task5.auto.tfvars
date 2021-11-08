task5_users = {
  "tfws-user1" = {
    email = "user1doesntexist@gmail.com"
    role  = "User"
    ssh_users = [
      {
        username   = "coucou"
        public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGQwGpzLk0IzqKnBpaHqecLA+X4zfHamNe9Rg3CoaXHF :oui_oui:"
      },
      {
        username   = "coucou3"
        public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGQwGpzLk0IzqKnBpaHqecLA+X4zfHamNe9Rg3CoaXHF :oui_oui:"
      }

    ]
  },
  "tfws-user2" = {
    email = "user2doesntexist@fakedomain.fr"
    role  = "Manager"
    ssh_users = [
      {
        username   = "coucou2"
        public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB7kcIWUEYSt50lAzslN7jXE8PXd3nJP3+l7CaSurYVC antoine@ANTOINE-PC"
      }
    ]
  },
}

