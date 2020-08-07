#
# @lc app=leetcode id=433 lang=ruby
#
# [433] Minimum Genetic Mutation
#

# @lc code=start
# @param {String} start
# @param {String} end
# @param {String[]} bank
# @return {Integer}
def min_mutation(start_g, end_g, bank)
  bank_set = Set.new(bank)
  return -1 if !bank_set.include?(end_g)

  queue = [[start_g, 0]]
  while queue.any?
    gene, level = queue.shift
    gene.chars.each_with_index do |c, i|
      ['A', 'C', 'G', 'T'].each do |g|
        next if c == g

        new_gene = gene[0...i] + g + gene[i+1..-1]
        if new_gene == end_g
          return level + 1
        elsif bank.include?(new_gene)
          queue << [new_gene, level + 1]
          bank.delete(new_gene)
        end
      end
    end
  end

  -1
end
# @lc code=end

