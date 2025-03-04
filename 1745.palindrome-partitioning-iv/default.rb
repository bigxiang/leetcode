#
# @lc app=leetcode.cn id=1745 lang=ruby
# @lcpr version=30204
#
# [1745] 分割回文串 IV
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} s
# @return {Boolean}
def check_partitioning(s)
  cache = Array.new(s.length) { Array.new(s.length, nil) }

  (1..s.length - 2).each do |i|
    next unless palindrome?(s, 0, i - 1, cache)

    (2..s.length - 1).each do |j|
      return true if palindrome?(s, i, j - 1, cache) && palindrome?(s, j, s.length - 1, cache)
    end
  end

  false
end

def palindrome?(s, l, r, cache)
  return true if l == r
  return cache[l][r] unless cache[l][r].nil?

  cache[l][r] =
    if l + 1 == r
      s[l] == s[r]
    else
      s[l] == s[r] && palindrome?(s, l + 1, r - 1, cache)
    end
end
# @lc code=end



#
# @lcpr case=start
# "abcbdd"\n
# @lcpr case=end

# @lcpr case=start
# "bcbddxy"\n
# @lcpr case=end

# @lcpr case=start
# "abd"\n
# @lcpr case=end

# @lcpr case=start
# "abdbacccjjaa"\n
# @lcpr case=end

# @lcpr case=start
# "abdbacccjjaajj"\n
# @lcpr case=end

# @lcpr case=start
# "uzzcpkcekajyojkwawbtnqxrltptuucrcgnkfephcrruypmxitchvkaauloavmpczujkjufnsvaptpojsnkltdomxhkkekgiyrsvoxsaqvlmnylptksbwvkbnlswbodjjuocirvpyvzkfrtdjtrhaaxngwomqfxtqbzwyddiilulovdhntqeaecjstzwikchbvhhqktphlvnlitcvsenrbygjskisuuelhvyzhmkxwbmkwyordkzramjlizoovskvizxhpdbxuwdpdcjtkicrwndskjxmmdwfpesnyvgkrxvuipsdrpomcexwscigvyzcmzsfpwezmsrwdmexbzlkxpbzvrdkenczretlgszvyugxqdfdiimokiowfmxlfjhwqkavvakqwhjflxmfwoikomiidfdqxguyvzsglterzcnekdrvzbpxklzbxemdwrsmzewpfszmczyvgicswxecmoprdspiuvxrkgvynsepfwdmmxjksdnwrciktjcdpdwuxbdphxzivksvooziljmarzkdroywkmbwxkmhzyvhleuusiksjgybrnesvctilnvlhptkqhhvbhckiwztsjceaeqtnhdvoluliiddywzbqtxfqmowgnxaahrtjdtrfkzvypvricoujjdobwslnbkvwbsktplynmlvqasxovsryigkekkhxmodtlknsjoptpavsnfujkjuzcpmvaoluaakvhctixmpyurrchpefkngcrcuutptlrxqntbwawkjoyjakeckpczzuoindqgeladfdzbytoqjkuselrehjvxeppexvjherlesukjqotybzdfdalegqdniooylufxugxreyamqqqptzuqxugxklzzqctzbueyfpfsmyocimrjbkrmqbdytpcmljxtmzlnnlzmtxjlmcptydbqmrkbjrmicoymsfpfyeubztcqzzlkxguxquztpqqqmayerxguxfulyo"\n
# @lcpr case=end
#

