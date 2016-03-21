class Object
	@monitor = Monitor.new
  @looking_for_consts = {}

  def self.const_missing c
    @monitor.synchronize do
      return nil if @looking_for_consts[c]
      @looking_for_consts[c] = true

      require Rulers.to_underscore(c.to_s)
      klass = Object.const_get c

      @looking_for_consts[c] = false

      klass
    end
  end
end
