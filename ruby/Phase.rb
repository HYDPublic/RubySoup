class Phase

    attr :name, :sequence 
  
    def initialize(n, s); @name = n; @sequence = s; end
  
    def to_s
      "#@name"
    end

  PREPROC_START = Phase.new('preprocess start', 1)
  PREPROC = Phase.new('preprocess', 2)
  PREPROC_END = Phase.new('preprocess end', 3)
  PROC_START = Phase.new('process start', 4)
  PROC = Phase.new('process', 5)
  PROC_END = Phase.new('process end', 6)
  POSTPROC_START = Phase.new('postprocess start', 7)
  POSTPROC = Phase.new('postprocess', 8)
  POSTPROC_END = Phase.new('postprocess end', 9)
    
    
end