#https://www.hackerrank.com/challenges/ruby-enumerable-collect/problem
#completed Oct 2017


def rot13(secret_messages)
  secret_messages.map{|x| x.tr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz?"
                               , "NOPQRSTUVWXyZABCDEFGHIJKLMnopqrstuvwxyzabcdefghijklm!")}
end



