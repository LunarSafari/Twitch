class Matrix
  attr_reader :rows, :column_count, :row_count

  def initialize rows, column_count = rows[0].size
    @rows = rows
    @row_count = rows.size
    @column_count = column_count
  end

  def self.[] *rows
    new rows
  end

  def self.column_vector(v)
    column = v.elements
    new [column].transpose, 1
  end

  def [](i, j)
    @rows.fetch(i){return nil}[j]
  end

  def column(j)
    col = Array.new(row_count) {|i|
      @rows[i][j]
    }
    Vector.new(col)
  end

  def *(m)
    case m
    when Numeric
      rows = @rows.collect {|row|
        row.collect {|e| e * m }
      }
      return self.class.new rows, @column_count
    when Vector
      m = self.class.column_vector(m)
      r = self * m
      return r.column(0)
    when Matrix
      raise "dimension mismatch" if @column_count != m.row_count
      rows = Array.new(row_count) {|i|
        Array.new(m.column_count) {|j|
          (0 ... column_count).inject(0) do |vij, k|
            vij + self[i, k] * m[k, j]
          end
        }
      }
      self.class.new rows, m.column_count
    end
  end

  def inspect
    "Matrix#{@rows.inspect}"
  end
  alias :to_s :inspect
end