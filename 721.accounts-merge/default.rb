#
# @lc app=leetcode.cn id=721 lang=ruby
# @lcpr version=30204
#
# [721] 账户合并
#

# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String[][]} accounts
# @return {String[][]}
def accounts_merge(accounts)
  merged_accounts = []
  email_map = {}
  deleted_accounts = Set.new
  accounts.each do |account|
    name = account[0]
    emails = account[1..]

    if (account_indexes = emails.map { |email| email_map[email] }.compact.uniq.sort).empty?
      # puts "new account: #{name} #{emails}"
      merged_accounts << [name, Set.new(emails)]
      emails.each { |email| email_map[email] = merged_accounts.size - 1 }
    else
      # puts "merge account: #{name} #{emails}, #{account_indexes}, #{email_map}"
      first_account = account_indexes.first
      account_indexes[1..].each do |account_index|
        merged_accounts[first_account][1].merge(merged_accounts[account_index][1])
        merged_accounts[account_index][1].each do |email|
          email_map[email] = first_account
        end
        deleted_accounts.add(account_index)
      end
      merged_accounts[first_account][1].merge(emails)
      emails.each { |email| email_map[email] = first_account }
    end
  end

  merged_accounts
    .reject.with_index { |_, i| deleted_accounts.include?(i) }
    .map { |account| [account[0]] + account[1].to_a.sort }
end
# @lc code=end

#
# @lcpr case=start
# [["John", "johnsmith@mail.com", "john00@mail.com"], ["John", "johnnybravo@mail.com"], ["John","johnsmith@mail.com", "john_newyork@mail.com"], ["Mary", "mary@mail.com"]]\n
# @lcpr case=end

# @lcpr case=start
# [["Gabe","Gabe0@m.co","Gabe3@m.co","Gabe1@m.co"],["Kevin","Kevin3@m.co","Kevin5@m.co","Kevin0@m.co"],["Ethan","Ethan5@m.co","Ethan4@m.co","Ethan0@m.co"],["Hanzo","Hanzo3@m.co","Hanzo1@m.co","Hanzo0@m.co"],["Fern","Fern5@m.co","Fern1@m.co","Fern0@m.co"]]\n
# @lcpr case=end

# @lcpr case=start
# [["David","David0@m.co","David1@m.co"],["David","David3@m.co","David4@m.co"],["David","David4@m.co","David5@m.co"],["David","David2@m.co","David3@m.co"],["David","David1@m.co","David2@m.co"]]\n
# @lcpr case=end

# @lcpr case=start
# [["Alex","Alex5@m.co","Alex4@m.co","Alex0@m.co"],["Ethan","Ethan3@m.co","Ethan3@m.co","Ethan0@m.co"],["Kevin","Kevin4@m.co","Kevin2@m.co","Kevin2@m.co"],["Gabe","Gabe0@m.co","Gabe3@m.co","Gabe2@m.co"],["Gabe","Gabe3@m.co","Gabe4@m.co","Gabe2@m.co"]]\n
# @lcpr case=end

# @lcpr case=start
# [["Hanzo","Hanzo2@m.co","Hanzo3@m.co"],["Hanzo","Hanzo4@m.co","Hanzo5@m.co"],["Hanzo","Hanzo0@m.co","Hanzo1@m.co"],["Hanzo","Hanzo3@m.co","Hanzo4@m.co"],["Hanzo","Hanzo7@m.co","Hanzo8@m.co"],["Hanzo","Hanzo1@m.co","Hanzo2@m.co"],["Hanzo","Hanzo6@m.co","Hanzo7@m.co"],["Hanzo","Hanzo5@m.co","Hanzo6@m.co"]]\n
# @lcpr case=end
#
