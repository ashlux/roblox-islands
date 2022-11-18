function disableFertileFlowerAnimation()
  for _,v in pairs(game:GetDescendants()) do
    if v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    end
  end
end
