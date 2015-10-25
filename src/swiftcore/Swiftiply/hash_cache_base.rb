require 'swiftcore/Swiftiply/cache_base_mixin'

module Swiftcore
	# Use Array instead of Deque, if Deque wasn't available.
	Deque = Array unless HasDeque or const_defined?(:Deque)

	module Swiftiply
		class CacheBase < Hash
			include CacheBaseMixin

			def initialize(vw = 900, time_limit = 0.05, maxsize = nil)
				@vw = vw
				@tl = time_limit
				@wvtl = vw * time_limit
				@old_vql = 0
				@vq = Deque.new
				@maxsize = maxsize #max size is irrelevant for a vanilla hash, but it'll be tracked anyway
				super()
			end
		end
	end
end