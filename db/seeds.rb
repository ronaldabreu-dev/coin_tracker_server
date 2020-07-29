Users.destroy_all
CoinUserComments.destroy_all

u1 = User.create(user_name: "testingtester001", password_digest: "123456")
u2 = User.create(user_name: "testingtester002", password_digest: "123456")

c1 = CoinUserComment.create(user: u1, coin: "BTC", comment: "Testing Testing 123, Bitcoin sucks.")
c1 = CoinUserComment.create(user: u1, coin: "ETH", comment: "Testing Testing 123, Ethereum is best.")
c1 = CoinUserComment.create(user: u2, coin: "BTC", comment: "Testing Testing 123, Bitcoin is awesome.")