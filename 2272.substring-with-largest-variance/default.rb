#
# @lc app=leetcode.cn id=2272 lang=ruby
# @lcpr version=30204
#
# [2272] 最大波动的子字符串
#


# @lcpr-template-start

# @lcpr-template-end
# @lc code=start
# @param {String} s
# @return {Integer}
def largest_variance(s)
  max_variance = 0
  (0...s.length).each do |i|
    char_map = Hash.new(0)
    max_count = 0
    min_count = 0
    min_char = nil

    (i...s.length).each do |j|
      if min_count.zero?
        char_map[s[j]] = 1

        max_count = 1
        min_count = 1
        min_char = s[j]
      else
        char_map[s[j]] += 1

        max_count = [max_count, char_map[s[j]]].max
        if min_char == s[j]
          min_count = char_map.values.min
          if min_count != char_map[s[j]]
            min_char = char_map.key(min_count)
          end
        end
      end
      max_variance = [max_variance, max_count - min_count].max
    end
  end

  max_variance
end
# @lc code=end



#
# @lcpr case=start
# "aababbb"\n
# @lcpr case=end

# @lcpr case=start
# "abcde"\n
# @lcpr case=end

# @lcpr case=start
# "a"\n
# @lcpr case=end

# @lcpr case=start
# "ab"\n
# @lcpr case=end

# @lcpr case=start
# "aa"\n
# @lcpr case=end

# @lcpr case=start
# "mxwfvgvrjjcarlfdrhejjlafpumaduvrhchghkrapacxoewlikjivtjzazwwubfpcglxuzvyakqalaksulmoxnfyfrpruclabnmsoxvcgvaroewabthkzvzvxymzjfbztdgnydjvsyznqoyixldyxwkusqmwvqhokgusexfokawdcyijnecbuhbcviwvrlkbxxheejiagrndojbglinytowukyzfyawvisfdrznrbquvflnakmjhxvdojoczrsidbjzrpwcsoyurrhrrnvfgkirasbifogltxnxdyxkldeugaipwdegxlqsfyliodmaxcflmbnepvavbvxyueajpqhgpmswsjmnqrlvigpujtmxzkrizunoyplhhdmsalslhqeemayvcccsbewvcncnbrivnupyffnkcrfcaqfiyhnhnpfxafuioftmocrkokaamjjhftebnrslohxxikxamtmattktksdwbmbocsqgiewryjodsqqqcvjbuosamvpaesntnmedpozzzdmnmxqihjfiouatikdvhwrziptquguaplsxjponxeectwjmqvewqfdovlnsiwxljmabmgtsmioqxfolutixwhmaqjcnryzzgpglsgbfeykgenxyosetwjakavezvyndpkgqlyhqoqqliroamjzadsommcpzzhmtlbkqsriiqdnfjwzdxqimrtngdttosemcckkzhuexxxbeqfwneafohpwftocloitdsbpiutvlyzebqsswqfczlyaoeomfnirburxskafncvcfzwrkqelvynwinvkgsgngozunuzaritcvdjgyhqsobomghopnkoemmvphrhxnpdpglljlfraikanzxhzmffadrmfvqkxgpazfqhidjyoxvmvsjlofqwkrsiwvvrmojdcuccfiwiebdkwoasfndvmzixayfkpymptkhzmnlfutbhfgpijtomgrjdcscwzrczrfgjvygpzddotbuiqwrejuiwohtvmeljaenbkglohqelxkoltiidxmkpdsjqhyasiyhwnwqimclrqqpayzifwdolgrbaytbqvekctgdekvtibkoliqwcpfelcltxmtgpxfmnftzkfuvsxhsgptxdmbdpiithkzrsfbxuxriswyiavqnjgbzmpoapwjvciajoecbvfpbhnfublgmkiuenehfggwkpeeehkaevojwqgwbjmpmfrkhycirfbcvelcusylqkwwharxlbgfgucqarlbnywpgqkbddwkriotyyhbnkljqxztyswhvsptnxydiziztbnxwdnkawkqmwcarbyejpnmzfndiyfxmfihnvscbuahiqhsyfifitzto"\n
# @lcpr case=end


#

